-- NvChad Theme - OneDark
-- Ported from OneDarkPro

local M = {}

M.base_30 = {
  white = "#abb2bf",
  darker_black = "#1e222a",
  black = "#282c34", --  nvim bg
  black2 = "#2d3139",
  one_bg = "#32363e", -- real bg of onedark
  one_bg2 = "#393f4a",
  one_bg3 = "#3f4551",
  grey = "#5c6370",
  grey_fg = "#646b75",
  grey_fg2 = "#6f7780",
  light_grey = "#7b828e",
  red = "#e06c75",
  baby_pink = "#e99ca4",
  pink = "#c678dd",
  line = "#3b4048", -- for lines like vertsplit
  green = "#98c379",
  vibrant_green = "#a5d187",
  nord_blue = "#81a1c1",
  blue = "#61afef",
  yellow = "#e5c07b",
  sun = "#e9cb87",
  purple = "#c678dd",
  dark_purple = "#b462cd",
  teal = "#56b6c2",
  orange = "#d19a66",
  cyan = "#56b6c2",
  statusline_bg = "#2b303b",
  lightbg = "#373d49",
  pmenu_bg = "#61afef",
  folder_bg = "#61afef",
  lavender = "#c5a0db",
}

M.base_16 = {
  base00 = "#282c34",
  base01 = "#32363e",
  base02 = "#3f4451",
  base03 = "#495162",
  base04 = "#7f848e",
  base05 = "#abb2bf",
  base06 = "#b6bdca",
  base07 = "#c8ccd4",
  base08 = "#e06c75",
  base09 = "#d19a66",
  base0A = "#e5c07b",
  base0B = "#98c379",
  base0C = "#56b6c2",
  base0D = "#61afef",
  base0E = "#c678dd",
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
