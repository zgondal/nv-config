-- ~/.config/nvim/lua/custom/configs/dashboard.lua (modified approach)
local dashboard = require("dashboard")
local api = vim.api

-- Function to create cmatrix terminal window
local function create_cmatrix_term()
  local bufnr = api.nvim_create_buf(false, true)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.43)
  local row = 1
  local col = math.floor((vim.o.columns - width) / 2)

  local opts = {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "none",
  }

  local win_id = api.nvim_open_win(bufnr, true, opts)
  api.nvim_win_set_option(win_id, "winhl", "Normal:DashboardTerminal")
  vim.fn.termopen("rusty-rain -C 0,196,0 -c jap -s")
  vim.cmd("setlocal nomodifiable")
  vim.cmd("setlocal nocursorline")
  vim.cmd("setlocal nocursorcolumn")

  return { bufnr = bufnr, win_id = win_id }
end

-- Store the cmatrix terminal information
local cmatrix_term = nil

-- Create a custom styled recent files list (not using Telescope)
local function create_recent_files_display()
  -- Create buffer for recent files
  local bufnr = api.nvim_create_buf(false, true)
  
  -- Set up window dimensions and position - below the cmatrix
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.5)
  local row = math.floor(vim.o.lines * 0.45) -- Position below cmatrix
  local col = math.floor((vim.o.columns - width) / 2)
  
  local opts = {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  }
  
  local win_id = api.nvim_open_win(bufnr, true, opts)
  api.nvim_win_set_option(win_id, "winhl", "Normal:DashboardFiles,FloatBorder:DashboardBorder")
  
  -- Get recent files list (limited to 10)
  local oldfiles = vim.v.oldfiles or {}
  local recent_files = {}
  local count = 0
  
  for _, file in ipairs(oldfiles) do
    -- Filter to show only relevant files, not system files
    if file:match("^%a") and not file:match("^/tmp") and vim.fn.filereadable(file) == 1 then
      table.insert(recent_files, file)
      count = count + 1
      if count >= 10 then break end
    end
  end
  
  -- Format header and files list
  local lines = {
    "                                           ",
    "              Recent Files                 ",
    "                                           ",
  }
  
  if #recent_files == 0 then
    table.insert(lines, "          No recent files found           ")
  else
    for i, file in ipairs(recent_files) do
      -- Format the filename for display (extract basename)
      local basename = vim.fn.fnamemodify(file, ":t")
      local dir = vim.fn.fnamemodify(file, ":h")
      local shortdir = vim.fn.pathshorten(dir)
      
      -- Add formatted line with number for easy selection
      table.insert(lines, string.format(" %d  %s  (%s)", i, basename, shortdir))
    end
  end
  
  -- Write lines to buffer
  api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
  
  -- Set buffer as non-modifiable
  vim.api.nvim_buf_set_option(bufnr, "modifiable", false)
  
  -- Add keymaps to open files
  for i = 1, #recent_files do
    -- Map number keys 1-9 to open corresponding file
    api.nvim_buf_set_keymap(bufnr, "n", tostring(i), 
      string.format(":e %s<CR>", vim.fn.fnameescape(recent_files[i])), 
      { noremap = true, silent = true })
  end
  
  -- Map 'q' and <Esc> to close the window
  api.nvim_buf_set_keymap(bufnr, "n", "q", 
    string.format(":lua vim.api.nvim_win_close(%d, true)<CR>", win_id), 
    { noremap = true, silent = true })
  api.nvim_buf_set_keymap(bufnr, "n", "<Esc>", 
    string.format(":lua vim.api.nvim_win_close(%d, true)<CR>", win_id), 
    { noremap = true, silent = true })
    
  -- Return focus to main dashboard to keep animation running
  vim.cmd("wincmd p")
  
  return { bufnr = bufnr, win_id = win_id }
end

-- Add highlight groups for our files list
api.nvim_command("highlight DashboardFiles guibg=NONE guifg=#88C0D0")
api.nvim_command("highlight DashboardBorder guibg=NONE guifg=#5E81AC")

-- Set up dashboard
dashboard.setup({
  theme = 'doom',
  config = {
    header = {
      "", "", "", "", "", "", "",
      "", "", "", "", "", "", "", "", "", "", "", "",
    },
    center = {
      {
        icon = "  ",
        desc = "Open Recent Files              ",
        key = "r",
        action = "lua require('custom.configs.dashboard').show_files()"
      },
      {
        icon = "  ",
        desc = "Find File                      ",
        key = "f",
        action = "Telescope find_files"
      },
      {
        icon = "  ",
        desc = "Find Word                      ",
        key = "g",
        action = "Telescope live_grep"
      },
      {
        icon = "  ",
        desc = "New File                       ",
        key = "n",
        action = "enew"
      },
      {
        icon = "  ",
        desc = "Quit Neovim                    ",
        key = "q",
        action = "qa"
      },
    },
    footer = function()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
    end,
  },
  hide = {
    statusline = false,
    tabline = false,
    winbar = false,
  },
})

-- Store recent files window info
local files_window = nil

-- Function to show recent files (exposed for keybinding)
local function show_files()
  if files_window then
    pcall(api.nvim_win_close, files_window.win_id, true)
    pcall(api.nvim_buf_delete, files_window.bufnr, { force = true })
  end
  
  files_window = create_recent_files_display()
end

-- Function to display cmatrix when dashboard is shown
local function on_dashboard_displayed()
  vim.defer_fn(function()
    if cmatrix_term then
      pcall(api.nvim_win_close, cmatrix_term.win_id, true)
      pcall(api.nvim_buf_delete, cmatrix_term.bufnr, { force = true })
    end

    cmatrix_term = create_cmatrix_term()

    -- Return to dashboard (don't auto-show files)
    vim.cmd("wincmd p")

    -- Ensure cmatrix is closed when leaving dashboard
    api.nvim_create_autocmd("BufLeave", {
      group = api.nvim_create_augroup("CustomDashboard", { clear = true }),
      buffer = api.nvim_get_current_buf(),
      callback = function()
        if cmatrix_term then
          pcall(api.nvim_win_close, cmatrix_term.win_id, true)
          pcall(api.nvim_buf_delete, cmatrix_term.bufnr, { force = true })
          cmatrix_term = nil
        end
        
        if files_window then
          pcall(api.nvim_win_close, files_window.win_id, true)
          pcall(api.nvim_buf_delete, files_window.bufnr, { force = true })
          files_window = nil
        end
      end,
      once = true,
    })
  end, 100)
end

-- Set up autocommand to show cmatrix when dashboard is displayed
api.nvim_create_autocmd("User", {
  group = api.nvim_create_augroup("CustomDashboard", { clear = true }),
  pattern = "DashboardLoaded",
  callback = on_dashboard_displayed,
})

-- Refresh dashboard command
api.nvim_create_user_command("RefreshDashboard", function()
  vim.cmd("Dashboard")
  on_dashboard_displayed()
end, {})

-- Create alternative method using the cellular automaton
api.nvim_create_user_command("DashboardMatrix", function()
  if pcall(require, "cellular-automaton") then
    vim.cmd("CellularAutomaton make_it_rain")
  else
    vim.notify("cellular-automaton.nvim is not installed", vim.log.levels.WARN)
  end
end, {})

-- Export the show_files function for keybinding
return {
  show_files = show_files
}
