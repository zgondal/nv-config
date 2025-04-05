-- NvChad Theme - Dark High Contrast
local M = {}

M.base_30 = {
  white = "#e5e5e5",
  darker_black = "#000000",
  black = "#000000", -- nvim bg
  black2 = "#0a0a0a",
  one_bg = "#121212", -- real bg
  one_bg2 = "#1a1a1a",
  one_bg3 = "#242424",
  grey = "#666666",
  grey_fg = "#707070",
  grey_fg2 = "#7a7a7a",
  light_grey = "#bfbfbf",
  red = "#e50000",
  baby_pink = "#ff0080",
  pink = "#e500e5",
  line = "#1a1a1a", -- for lines like vertsplit
  green = "#00d900",
  vibrant_green = "#00f900",
  nord_blue = "#0000ff",
  blue = "#2009db",
  yellow = "#e5e500",
  sun = "#ffff00",
  purple = "#b200b2",
  dark_purple = "#a200a2",
  teal = "#00a6b2",
  orange = "#e5e500",
  cyan = "#00e5e5",
  statusline_bg = "#0a0a0a",
  lightbg = "#1a1a1a",
  pmenu_bg = "#2009db",
  folder_bg = "#2009db",
  lavender = "#d59dff",
}

M.base_16 = {
  base00 = "#000000",
  base01 = "#121212",
  base02 = "#1a1a1a",
  base03 = "#666666",
  base04 = "#8c8c8c",
  base05 = "#f2f2f2",
  base06 = "#f7f7f7",
  base07 = "#ffffff",
  base08 = "#e50000",
  base09 = "#e5e500",
  base0A = "#e5e500",
  base0B = "#00d900",
  base0C = "#00a6b2",
  base0D = "#2009db",
  base0E = "#b200b2",
  base0F = "#e5e500",
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
    DiffAdd = { bg = "#002000" },
    DiffDelete = { bg = "#200000" },
    DiffChange = { bg = "#001020" },
    DiffText = { bg = "#002040" },
  },
  visual = {
    Visual = { bg = "#414141", fg = "#000000" }, -- selection colors
  },
  cursor = {
    Cursor = { fg = "#000000", bg = "#4d4d4d" }, -- cursor color
  }
}

M.type = "dark"

return M
