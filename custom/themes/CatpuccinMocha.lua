-- NvChad Theme - Catppuccin (Macchiato variant)
local M = {}

M.base_30 = {
  white = "#cdd6f4",
  darker_black = "#0d0d17",
  black = "#1e1e2e", -- nvim bg
  black2 = "#242434",
  one_bg = "#313244", -- real bg of catppuccin
  one_bg2 = "#3a3a4d",
  one_bg3 = "#444456",
  grey = "#585b70",
  grey_fg = "#63677d",
  grey_fg2 = "#6e728a",
  light_grey = "#7f849c",
  red = "#f38ba8",
  baby_pink = "#ffa5c1",
  pink = "#f5c2e7",
  line = "#313244", -- for lines like vertsplit
  green = "#a6e3a1",
  vibrant_green = "#b6f0b1",
  nord_blue = "#89b4fa",
  blue = "#89b4fa",
  yellow = "#f9e2af",
  sun = "#fce9bf",
  purple = "#cba6f7",
  dark_purple = "#b58ef2",
  teal = "#94e2d5",
  orange = "#fab387",
  cyan = "#89dceb",
  statusline_bg = "#242434",
  lightbg = "#3a3a4d",
  pmenu_bg = "#89b4fa",
  folder_bg = "#89b4fa",
  lavender = "#b4befe",
}

M.base_16 = {
  base00 = "#1e1e2e",
  base01 = "#313244",
  base02 = "#3a3a4d",
  base03 = "#585b70",
  base04 = "#7f849c",
  base05 = "#cdd6f4",
  base06 = "#d8e1f9",
  base07 = "#e6edfe",
  base08 = "#f38ba8",
  base09 = "#fab387",
  base0A = "#f9e2af",
  base0B = "#a6e3a1",
  base0C = "#89dceb",
  base0D = "#89b4fa",
  base0E = "#cba6f7",
  base0F = "#f9e2af",
}

M.polish_hl = {
  syntax = {
    Comment = { fg = "#7f849c" },
    Conditional = { fg = M.base_30.purple },
    Keyword = { fg = M.base_30.purple },
    Type = { fg = M.base_30.yellow },
    Function = { fg = M.base_30.blue },
    String = { fg = M.base_30.green },
    Number = { fg = M.base_30.orange },
    Operator = { fg = M.base_30.purple },
    Constant = { fg = M.base_30.cyan },
    Tag = { fg = M.base_30.red },
  },
  treesitter = {
    ["@parameter"] = { fg = M.base_30.orange },
    ["@keyword"] = { fg = M.base_30.purple },
    ["@string"] = { fg = M.base_30.green },
    ["@function"] = { fg = M.base_30.blue },
    ["@function.builtin"] = { fg = M.base_30.cyan },
    ["@property"] = { fg = M.base_30.orange },
    ["@field"] = { fg = M.base_30.orange },
    ["@namespace"] = { fg = M.base_30.yellow },
  },
  git = {
    DiffAdd = { bg = "#2e3a3a" },
    DiffDelete = { bg = "#4a2a32" },
    DiffChange = { bg = "#2a2e3a" },
    DiffText = { bg = "#2a3a4a" },
  },
}

M.type = "dark"

return M
