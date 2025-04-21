-- ~/.config/nvim/lua/custom/init.lua
-- Custom init file for NvChad

-- Set up autocmd to increase oldfiles limit for better recent files display
vim.opt.shada = "!,'1000,<50,s10,h"
vim.opt.history = 1000

-- If you want to set dashboard as your start screen
vim.g.dashboard_default_executive = "telescope"

-- Add custom highlight groups
vim.api.nvim_command("highlight DashboardHeader guifg=#5E81AC")
vim.api.nvim_command("highlight DashboardCenter guifg=#88C0D0")
vim.api.nvim_command("highlight DashboardShortcut guifg=#EBCB8B")
vim.api.nvim_command("highlight DashboardFooter guifg=#A3BE8C")

-- Add any other custom settings here

-- Add keymaps for the dashboard
vim.api.nvim_create_autocmd("FileType", {
  pattern = "dashboard",
  callback = function()
    -- Map keys for dashboard navigation
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>r', ':RefreshDashboard<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>f', ':Telescope find_files<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>g', ':Telescope live_grep<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, 'n', '<Esc>', ':qa<CR>', { noremap = true, silent = true })
  end
})

-- Check if cmatrix is installed
local function is_cmatrix_installed()
  local handle = io.popen("which cmatrix 2>/dev/null")
  if handle then
    local result = handle:read("*a")
    handle:close()
    return result and result:len() > 0
  end
  return false
end

-- Notify if cmatrix is not installed
if not is_cmatrix_installed() then
  vim.defer_fn(function()
    vim.notify(
      "cmatrix is not installed. To get the full dashboard experience, install it with your package manager.\n" ..
      "For example: 'sudo apt install cmatrix' or 'brew install cmatrix'\n" ..
      "Alternatively, you can use the ':DashboardMatrix' command which uses cellular-automaton.nvim.",
      vim.log.levels.WARN
    )
  end, 1000)
end
