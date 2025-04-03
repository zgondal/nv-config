-- NvChad Theme - OneDark Dark (Pure Black)
-- Ported from OneDarkPro black variant

local M = {}

M.base_30 = {
  white = "#abb2bf",
  darker_black = "#000000", -- already as dark as possible
  black = "#000000", --  nvim bg
  black2 = "#0f0f0f",
  one_bg = "#171717", -- real bg of onedark
  one_bg2 = "#222222",
  one_bg3 = "#2d2d2d",
  grey = "#434852",
  grey_fg = "#545965",
  grey_fg2 = "#636875",
  light_grey = "#7f848e",
  red = "#ef596f",
  baby_pink = "#ff7a8d",
  pink = "#d55fde",
  line = "#171717", -- for lines like vertsplit
  green = "#89ca78",
  vibrant_green = "#98d985",
  nord_blue = "#81a1c1",
  blue = "#61afef",
  yellow = "#e5c07b",
  sun = "#eeca95",
  purple = "#d55fde",
  dark_purple = "#c64ed3",
  teal = "#2bbac5",
  orange = "#d19a66",
  cyan = "#2bbac5",
  statusline_bg = "#0d0d0d",
  lightbg = "#272727",
  pmenu_bg = "#61afef",
  folder_bg = "#61afef",
  lavender = "#d292e4",
}

M.base_16 = {
  base00 = "#000000",
  base01 = "#171717",
  base02 = "#222222",
  base03 = "#434852",
  base04 = "#7f848e",
  base05 = "#abb2bf",
  base06 = "#b6bdca",
  base07 = "#c8ccd4",
  base08 = "#ef596f",
  base09 = "#d19a66",
  base0A = "#e5c07b",
  base0B = "#89ca78",
  base0C = "#2bbac5",
  base0D = "#61afef",
  base0E = "#d55fde",
  base0F = "#e2be7d",
}

M.polish_hl = {
  syntax = {
    Comment = { fg = "#7f848e" },
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
    DiffAdd = { bg = "#43554d" },
    DiffDelete = { bg = "#6f2e2d" },
    DiffChange = { bg = "#41483d" },
    DiffText = { bg = "#005869" },
  },
}

M.type = "dark"

return M
