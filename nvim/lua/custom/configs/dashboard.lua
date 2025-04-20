-- ~/.config/nvim/lua/custom/configs/dashboard.lua
local dashboard = require("dashboard")
local api = vim.api

-- Function to create cmatrix terminal window
local function create_cmatrix_term()
  -- Check if cmatrix is enabled
  if _G.DashboardConfig and not _G.DashboardConfig.cmatrix.enabled then
    return nil
  end

  local bufnr = api.nvim_create_buf(false, true)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * (_G.DashboardConfig and _G.DashboardConfig.cmatrix.height_percent or 0.43))
  local row = _G.DashboardConfig and _G.DashboardConfig.cmatrix.row or 1
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
  vim.fn.termopen("cmatrix -b -u 4")
  -- vim.fn.termopen("rusty-rain -c jap -s -S 40,60 ")

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

-- Setup dashboard
dashboard.setup({
  theme = 'doom',
  config = {
    header = {
      "", "", "", "", "", "", "",
      -- The cmatrix will be displayed above this empty space
      "", "", "", "", "", "", "", "", "", "", "", "",
    },
    -- Empty center section as we'll use a Telescope window instead
    center = {},
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

-- Create alternative method using the cellular automaton for systems without cmatrix
api.nvim_create_user_command("DashboardMatrix", function()
  -- Check if cellular-automaton.nvim is loaded
  if pcall(require, "cellular-automaton") then
    vim.cmd("CellularAutomaton make_it_rain")
  else
    vim.notify("cellular-automaton.nvim is not installed", vim.log.levels.WARN)
  end
end, {})

-- Create a command to refresh the dashboard, cmatrix, and Telescope
api.nvim_create_user_command("RefreshDashboard", function()
  -- Close any existing windows that might interfere
  for _, win in ipairs(api.nvim_list_wins()) do
    local buf = api.nvim_win_get_buf(win)
    local buf_name = api.nvim_buf_get_name(buf)
    -- Close Telescope windows and any floating terminals
    if buf_name:match(".*Telescope.*") or vim.api.nvim_win_get_config(win).relative ~= "" then
      pcall(api.nvim_win_close, win, true)
    end
  end

  -- Reload dashboard
  vim.cmd("Dashboard")

  -- Trigger cmatrix display and Telescope
  on_dashboard_displayed()
end, {})

-- Create a command to configure the dashboard
api.nvim_create_user_command("DashboardConfigure", function(opts)
  -- Parse the args to modify configuration
  local args = opts.args
  if args == "" then
    -- Show current configuration if no args
    print(vim.inspect(_G.DashboardConfig))
    return
  end

  -- Parse the args as a Lua table
  local success, config = pcall(loadstring, "return " .. args)
  if success and config then
    -- Apply configuration
    _G.ApplyDashboardConfig(config())
  else
    vim.notify("Failed to parse configuration. Please use Lua table syntax.", vim.log.levels.ERROR)
  end
end, {
  nargs = "?",
  complete = function()
    return {
      "{cmatrix = {height_percent = 0.3, row = 2}}",
      "{telescope = {row_percent = 0.35, use_live_grep = true}}",
      "{telescope = {results_width = 0.5, preview_width = 0.5}}",
    }
  end
})
