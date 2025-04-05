-- NvChad Theme - High Contrast Terminal
local M = {}

M.base_30 = {
  white = "#ffffff",
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
  red = "#ff5555",
  baby_pink = "#ff8888",
  pink = "#ff55ff",
  line = "#1a1a1a", -- for lines like vertsplit
  green = "#55ff55",
  vibrant_green = "#75ff75",
  nord_blue = "#5555ff",
  blue = "#5555ff",
  yellow = "#ffff55",
  sun = "#ffff75",
  purple = "#ff55ff",
  dark_purple = "#ee44ee",
  teal = "#55ffff",
  orange = "#ffaa55",
  cyan = "#55ffff",
  statusline_bg = "#0a0a0a",
  lightbg = "#1a1a1a",
  pmenu_bg = "#5555ff",
  folder_bg = "#5555ff",
  lavender = "#ff88ff",
}

M.base_16 = {
  base00 = "#000000",
  base01 = "#121212",
  base02 = "#1a1a1a",
  base03 = "#555555",
  base04 = "#888888",
  base05 = "#ffffff",
  base06 = "#eeeeee",
  base07 = "#bbbbbb", -- cursor color
  base08 = "#ff5555",
  base09 = "#ffaa55",
  base0A = "#ffff55",
  base0B = "#55ff55",
  base0C = "#55ffff",
  base0D = "#5555ff",
  base0E = "#ff55ff",
  base0F = "#ffff55",
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
    DiffAdd = { bg = "#0d300d" },
    DiffDelete = { bg = "#300d0d" },
    DiffChange = { bg = "#0d1a30" },
    DiffText = { bg = "#1a3a5a" },
  },
  visual = {
    Visual = { bg = "#b5d5ff", fg = "#000000" }, -- selection colors
  }
}

M.type = "dark"

return M
