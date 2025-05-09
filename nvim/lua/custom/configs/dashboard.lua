-- ~/.config/nvim/lua/custom/configs/dashboard.lua
local dashboard = require("dashboard")
local api = vim.api

-- Function to create cmatrix terminal window
local function create_cmatrix_term()
  local bufnr = api.nvim_create_buf(false, true)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.43) -- Reduced height to avoid overlapping
  local row = 1 -- Position at the top of the screen with minimal padding
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

  -- Set terminal options
  api.nvim_win_set_option(win_id, "winhl", "Normal:DashboardTerminal")

  -- Start cmatrix in the terminal
  -- vim.fn.termopen("cmatrix -b")
  vim.fn.termopen("rusty-rain -C 0,249,0 -c jap -s")
  -- vim.fn.termopen("rusty-rain -C 0,199,0 -c alpha-num -S 60,80 -s")

  -- Set the terminal to non-modifiable and disable cursor
  vim.cmd("setlocal nomodifiable")
  vim.cmd("setlocal nocursorline")
  vim.cmd("setlocal nocursorcolumn")

  -- Return to dashboard window
  vim.cmd("wincmd p")

  return { bufnr = bufnr, win_id = win_id }
end

-- Store the cmatrix terminal information
local cmatrix_term = nil

-- Setup dashboard with dynamic center section
dashboard.setup({
  theme = 'hyper',
  config = {
    week_header = { enable = false },
    packages = { enable = false },   -- Disable package updates
    project = { enable = false },    -- Disable project stats
    mru = { enable = true, cwd_only = true },        -- Disable default recent files
    shortcut = {},
    shortcut_type = { 'number' },
    header = {
      "", "", "", "", "", "", "",
      -- The cmatrix will be displayed above this empty space
      "", "", "", "", "", "", "", "", "", "", "", "",
      "", "", "", "", "", "", "", "", "", "", "", "",
      "", "", "", "", "", "", "", "", "", "", "", "",
      "", "", "", "", "", "", "", "", "", "", "", "",
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

-- Create highlight group for terminal window
api.nvim_command("highlight DashboardTerminal guibg=NONE ctermbg=NONE")

-- Create autocommand group for dashboard
local augroup = api.nvim_create_augroup("CustomDashboard", { clear = true })

-- Function to display cmatrix when dashboard is shown
local function on_dashboard_displayed()
  -- Wait a bit to ensure dashboard is fully rendered
  vim.defer_fn(function()
    if cmatrix_term then
      -- Close previous cmatrix if exists
      pcall(api.nvim_win_close, cmatrix_term.win_id, true)
      pcall(api.nvim_buf_delete, cmatrix_term.bufnr, { force = true })
    end

    -- Create new cmatrix terminal
    cmatrix_term = create_cmatrix_term()

    -- Ensure cmatrix is closed when leaving dashboard
    api.nvim_create_autocmd("BufLeave", {
      group = augroup,
      buffer = api.nvim_get_current_buf(),
      callback = function()
        if cmatrix_term then
          pcall(api.nvim_win_close, cmatrix_term.win_id, true)
          pcall(api.nvim_buf_delete, cmatrix_term.bufnr, { force = true })
          cmatrix_term = nil
        end
      end,
      once = true,
    })
  end, 100)
end

-- Set up autocommand to show cmatrix when dashboard is displayed
api.nvim_create_autocmd("User", {
  group = augroup,
  pattern = "DashboardLoaded",
  callback = on_dashboard_displayed,
})

-- Create a command to refresh the dashboard, cmatrix, and Telescope
api.nvim_create_user_command("RefreshDashboard", function()
  -- Close any existing Telescope windows
  for _, win in ipairs(api.nvim_list_wins()) do
    local buf = api.nvim_win_get_buf(win)
    local buf_name = api.nvim_buf_get_name(buf)
    if buf_name:match(".*Telescope.*") then
      pcall(api.nvim_win_close, win, true)
    end
  end

  -- Reload dashboard
  vim.cmd("Dashboard")

  -- Trigger cmatrix display and Telescope
  on_dashboard_displayed()
end, {})

-- Add keymap to load session
vim.api.nvim_buf_set_keymap(0, 'n', 'sr', ':SessionRestore<CR>', { noremap = true, silent = true })
