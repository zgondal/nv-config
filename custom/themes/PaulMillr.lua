-- NvChad Theme - Dark Vibrant
local M = {}

M.base_30 = {
  white = "#f2f2f2",
  darker_black = "#1a1a1a",
  black = "#2a2a2a", -- nvim bg
  black2 = "#343434",
  one_bg = "#353535", -- real bg
  one_bg2 = "#3f3f3f",
  one_bg3 = "#494949",
  grey = "#666666",
  grey_fg = "#707070",
  grey_fg2 = "#7a7a7a",
  light_grey = "#bbbbbb",
  red = "#ff0000",
  baby_pink = "#ff0080",
  pink = "#db67e6",
  line = "#3f3f3f", -- for lines like vertsplit
  green = "#79ff0f",
  vibrant_green = "#89ff1f",
  nord_blue = "#709aed",
  blue = "#396bd7",
  yellow = "#e7bf00",
  sun = "#f3d64e",
  purple = "#b449be",
  dark_purple = "#a439ae",
  teal = "#66ccff",
  orange = "#e7bf00",
  cyan = "#7adff2",
  statusline_bg = "#343434",
  lightbg = "#3f3f3f",
  pmenu_bg = "#396bd7",
  folder_bg = "#396bd7",
  lavender = "#d59dff",
}

M.base_16 = {
  base00 = "#2a2a2a",
  base01 = "#353535",
  base02 = "#3f3f3f",
  base03 = "#666666",
  base04 = "#8c8c8c",
  base05 = "#f2f2f2",
  base06 = "#f7f7f7",
  base07 = "#ffffff",
  base08 = "#ff0000",
  base09 = "#e7bf00",
  base0A = "#f3d64e",
  base0B = "#79ff0f",
  base0C = "#66ccff",
  base0D = "#396bd7",
  base0E = "#b449be",
  base0F = "#e7bf00",
}

M.polish_hl = {
  syntax = {
    Comment = { fg = "#666666" },
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
    DiffAdd = { bg = "#1f3a1f" },
    DiffDelete = { bg = "#3a1f1f" },
    DiffChange = { bg = "#1f2f3a" },
    DiffText = { bg = "#2f3f5a" },
  },
  visual = {
    Visual = { bg = "#414141", fg = "#ffffff" }, -- selection colors
  },
  cursor = {
    Cursor = { fg = "#2a2a2a", bg = "#4d4d4d" }, -- cursor color
  }
}

M.type = "dark"

return M
