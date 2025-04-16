-- NvChad Theme - Aura Soft Dark
local M = {}

M.base_30 = {
  white = "#edecee",
  darker_black = "#1a1920",
  black = "#21202e", -- nvim bg
  black2 = "#262534",
  one_bg = "#2b2a39",
  one_bg2 = "#31303f",
  one_bg3 = "#373645",
  grey = "#6d6d6d",
  grey_fg = "#757575",
  grey_fg2 = "#7d7d7d",
  light_grey = "#8a8a8a",
  red = "#ff6767",
  baby_pink = "#ff8a8a",
  pink = "#f694ff",
  line = "#2b2a39", -- for lines like vertsplit
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
  statusline_bg = "#262534",
  lightbg = "#31303f",
  pmenu_bg = "#a277ff",
  folder_bg = "#82e2ff",
  lavender = "#c9a3ff",
}

M.base_16 = {
  base00 = "#21202e",
  base01 = "#2b2a39",
  base02 = "#31303f",
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

M = require("base46").override_theme(M, "oxocarbon")

return M
