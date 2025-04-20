-- NvChad Theme - Aura Dark
local M = {}

M.base_30 = {
  white = "#edecee",
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
  red = "#ff6767",
  baby_pink = "#ff8a8a",
  pink = "#f694ff",
  line = "#1f1e25", -- for lines like vertsplit
  green = "#61ffca",
  vibrant_green = "#7affd4",
  nord_blue = "#82e2ff",
  blue = "#82e2ff",
  yellow = "#ffca85",
  sun = "#ffd79e",
  purple = "#a277ff",
  dark_purple = "#8d5eff",
  teal = "#61ffca",
  orange = "#ffca85",
  cyan = "#82e2ff",
  statusline_bg = "#1a1920",
  lightbg = "#25242b",
  pmenu_bg = "#a277ff",
  folder_bg = "#82e2ff",
  lavender = "#c9a3ff",
}

M.base_16 = {
  base00 = "#15141b",
  base01 = "#1f1e25",
  base02 = "#25242b",
  base03 = "#6d6d6d",
  base04 = "#8a8a8a",
  base05 = "#edecee",
  base06 = "#f0eff1",
  base07 = "#f3f2f4",
  base08 = "#ff6767",
  base09 = "#ffca85",
  base0A = "#ffca85",
  base0B = "#61ffca",
  base0C = "#82e2ff",
  base0D = "#82e2ff",
  base0E = "#a277ff",
  base0F = "#ffca85",
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
