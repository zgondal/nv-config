-- NvChad Theme - Aura Dark Soft Text
local M = {}

M.base_30 = {
  white = "#bdbdbd",
  darker_black = "#0f0e15",
  black = "#15141b", -- nvim bg
  black2 = "#1a1920",
  one_bg = "#1f1e25",
  one_bg2 = "#25242b",
  one_bg3 = "#2b2a31",
  grey = "#6d6d6d",
  grey_fg = "#757575",
  grey_fg2 = "#7d7d7d",
  light_grey = "#8a8a8a",
  red = "#c55858",
  baby_pink = "#d17575",
  pink = "#c17ac8",
  line = "#1f1e25", -- for lines like vertsplit
  green = "#54c59f",
  vibrant_green = "#65d0ae",
  nord_blue = "#6cb2c7",
  blue = "#6cb2c7",
  yellow = "#c7a06f",
  sun = "#d1b07f",
  purple = "#8464c6",
  dark_purple = "#7552c0",
  teal = "#54c59f",
  orange = "#c7a06f",
  cyan = "#6cb2c7",
  statusline_bg = "#1a1920",
  lightbg = "#25242b",
  pmenu_bg = "#8464c6",
  folder_bg = "#6cb2c7",
  lavender = "#a78fdb",
}

M.base_16 = {
  base00 = "#15141b",
  base01 = "#1f1e25",
  base02 = "#25242b",
  base03 = "#6d6d6d",
  base04 = "#8a8a8a",
  base05 = "#bdbdbd",
  base06 = "#c5c5c5",
  base07 = "#cdcdcd",
  base08 = "#c55858",
  base09 = "#c7a06f",
  base0A = "#c7a06f",
  base0B = "#54c59f",
  base0C = "#6cb2c7",
  base0D = "#6cb2c7",
  base0E = "#8464c6",
  base0F = "#c7a06f",
}

M.polish_hl = {
  syntax = {
    Comment = { fg = M.base_30.grey },
    Conditional = { fg = M.base_30.purple },
    Keyword = { fg = M.base_30.purple },
    Type = { fg = M.base_30.orange },
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
}

M.type = "dark"

return M
