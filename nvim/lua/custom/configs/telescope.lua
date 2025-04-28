-- ~/.config/nvim/lua/custom/configs/telescope.lua
local M = {}

function M.setup()
  local telescope = require("telescope")

  telescope.setup({
    defaults = {
      prompt_prefix = "   ",
      selection_caret = "  ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
          results_width = 0.8,
        },
        vertical = {
          mirror = false,
          prompt_position = "top",
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },
      border = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      color_devicons = true,
      set_env = { ["COLORTERM"] = "truecolor" },
      mappings = {
        i = {
          ["<C-j>"] = require("telescope.actions").move_selection_next,
          ["<C-k>"] = require("telescope.actions").move_selection_previous,
          ["<C-q>"] = require("telescope.actions").send_to_qflist + require("telescope.actions").open_qflist,
        },
        n = {
          ["q"] = require("telescope.actions").close,
          ["<C-j>"] = require("telescope.actions").move_selection_next,
          ["<C-k>"] = require("telescope.actions").move_selection_previous,
          ["<C-q>"] = require("telescope.actions").send_to_qflist + require("telescope.actions").open_qflist,
        },
      },
    },
    extensions = {
      -- Add extensions configuration here if needed
    },
  })

  -- Load extensions if you have any
  -- telescope.load_extension("fzf")
end

-- Define custom Telescope picker specifically for the dashboard
function M.dashboard_oldfiles()
  -- Adjust dimensions based on screen size
  local defaults = {
    width = math.floor(vim.o.columns * 0.8),
    height = math.floor(vim.o.lines * 0.4),
    row = math.floor(vim.o.lines * 0.48), -- Position below the cmatrix
    col = math.floor((vim.o.columns - math.floor(vim.o.columns * 0.8)) / 2),
    results_width = 0.4, -- 40% for results
    preview_width = 0.6, -- 60% for preview
    use_live_grep = false -- Whether to use live_grep instead of oldfiles
  }

  local buf = vim.api.nvim_create_buf(false, true)
  local float_opts = {
    relative = 'editor',
    row = defaults.row,
    col = defaults.col,
    width = defaults.width,
    height = defaults.height,
    style = 'minimal',
    border = 'none',
  }

  local win = vim.api.nvim_open_win(buf, true, float_opts)
  vim.api.nvim_win_set_option(win, 'winhl', 'Normal:Normal')

  vim.defer_fn(function()
    -- Use telescope.builtin directly with custom config that forces position
    local actions = require('telescope.actions')
    local action_state = require('telescope.actions.state')
    local builtin = require('telescope.builtin')

    -- Use oldfiles instead of live_grep for recent files
    builtin.oldfiles({
      prompt_title = '󰈞 Recent Files',
      results_title = false,
      preview_title = false,

      -- Force telescope to use our window dimensions
      layout_strategy = 'cursor',
      layout_config = {
        width = defaults.width,
        height = defaults.height,
      },

      -- Keep Telescope from auto-closing our window
      attach_mappings = function(prompt_bufnr, map)
        -- Keep default mappings
        return true
      end,

      -- Close our temporary window after Telescope setup
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      sorting_strategy = 'ascending',
      path_display = { "truncate" },
    })

    -- Close our temporary window once Telescope is set up
    vim.api.nvim_win_close(win, true)
  end, 20)  -- Small delay to ensure window is ready
end

return M
