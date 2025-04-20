-- NvChad Theme - Modern Terminal
local M = {}

M.base_30 = {
  white = "#f2f2f2",
  darker_black = "#000000",
  black = "#000000", -- nvim bg
  black2 = "#0a0a0a",
  one_bg = "#121212", -- real bg
  one_bg2 = "#1a1a1a",
  one_bg3 = "#242424",
  grey = "#555555",
  grey_fg = "#666666",
  grey_fg2 = "#777777",
  light_grey = "#bbbbbb",
  red = "#e52222",
  baby_pink = "#ff5555",
  pink = "#fa2573",
  line = "#1a1a1a", -- for lines like vertsplit
  green = "#a6e32d",
  vibrant_green = "#b6f33d",
  nord_blue = "#c48dff",
  blue = "#c48dff",
  yellow = "#fc951e",
  sun = "#ffa52e",
  purple = "#fa2573",
  dark_purple = "#ea1563",
  teal = "#67d9f0",
  orange = "#fc951e",
  cyan = "#67d9f0",
  statusline_bg = "#0a0a0a",
  lightbg = "#1a1a1a",
  pmenu_bg = "#c48dff",
  folder_bg = "#c48dff",
  lavender = "#d59dff",
}

M.base_16 = {
  base00 = "#000000",
  base01 = "#121212",
  base02 = "#1a1a1a",
  base03 = "#555555",
  base04 = "#888888",
  base05 = "#bbbbbb", -- foreground
  base06 = "#d1d1d1",
  base07 = "#f2f2f2",
  base08 = "#e52222",
  base09 = "#fc951e",
  base0A = "#ffff55",
  base0B = "#a6e32d",
  base0C = "#67d9f0",
  base0D = "#c48dff",
  base0E = "#fa2573",
  base0F = "#fc951e",
}

M.polish_hl = {
  syntax = {
    Comment = { fg = "#555555" },
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
    DiffAdd = { bg = "#1a3a1a" },
    DiffDelete = { bg = "#3a1a1a" },
    DiffChange = { bg = "#1a2a3a" },
    DiffText = { bg = "#2a3a5a" },
  },
  visual = {
    Visual = { bg = "#555555", fg = "#f2f2f2" }, -- selection colors
  },
  cursor = {
    Cursor = { fg = "#000000", bg = "#bbbbbb" }, -- cursor color
  }
}

M.type = "dark"

return M
