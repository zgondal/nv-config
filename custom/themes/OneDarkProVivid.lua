-- NvChad Theme - OneDark Vivid
-- Ported from onedark_vivid

local M = {}

M.base_30 = {
  white = "#abb2bf",
  darker_black = "#1e222a",
  black = "#282c34", -- nvim bg
  black2 = "#2d3139",
  one_bg = "#353b45", -- real bg of onedark
  one_bg2 = "#3a4048",
  one_bg3 = "#3e444c",
  grey = "#5c6370",
  grey_fg = "#636a77",
  grey_fg2 = "#6c737f",
  light_grey = "#7f848e",
  red = "#ef596f",
  baby_pink = "#ff7a8d",
  pink = "#d55fde",
  line = "#353b45", -- for lines like vertsplit
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
  statusline_bg = "#2d3139",
  lightbg = "#3a4048",
  pmenu_bg = "#61afef",
  folder_bg = "#61afef",
  lavender = "#d292e4",
}

M.base_16 = {
  base00 = "#282c34",
  base01 = "#353b45",
  base02 = "#3a4048",
  base03 = "#5c6370",
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
