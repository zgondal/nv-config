require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")


local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Keybindings for avante.nvim
map("n", "<leader>ap", function()
  require("avante").toggle() -- Toggle Planning Mode (sidebar)
end, { desc = "avante: toggle planning mode" })

map("v", "<leader>ae", function()
  require("avante").edit() -- Enter Editing Mode (on selected code block)
end, { desc = "avante: edit selection" })

map("n", "<leader>ak", function()
  require("avante").toggle() -- Toggle Cursor-Planning Mode (Tab flow)
end, { desc = "avante: toggle cursor-planning mode" })
