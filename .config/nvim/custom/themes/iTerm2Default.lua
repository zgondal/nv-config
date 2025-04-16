-- NvChad Theme - Classic Terminal
local M = {}

M.base_30 = {
  white = "#ffffff",
  darker_black = "#000000",
  black = "#000000", -- nvim bg
  black2 = "#0a0a0a",
  one_bg = "#121212", -- real bg
  one_bg2 = "#1a1a1a",
  one_bg3 = "#242424",
  grey = "#686868",
  grey_fg = "#7a7a7a",
  grey_fg2 = "#8c8c8c",
  light_grey = "#9e9e9e",
  red = "#ff6e67",
  baby_pink = "#ff9e99",
  pink = "#ff77ff",
  line = "#1a1a1a", -- for lines like vertsplit
  green = "#5ffa68",
  vibrant_green = "#7aff82",
  nord_blue = "#6871ff",
  blue = "#6871ff",
  yellow = "#fffc67",
  sun = "#fffd8a",
  purple = "#ca30c7",
  dark_purple = "#b820b5",
  teal = "#00c5c7",
  orange = "#ff9e67",
  cyan = "#60fdff",
  statusline_bg = "#0a0a0a",
  lightbg = "#1a1a1a",
  pmenu_bg = "#6871ff",
  folder_bg = "#6871ff",
  lavender = "#d77fff",
}

M.base_16 = {
  base00 = "#000000",
  base01 = "#121212",
  base02 = "#1a1a1a",
  base03 = "#686868",
  base04 = "#9e9e9e",
  base05 = "#ffffff",
  base06 = "#f5f5f5",
  base07 = "#e5e5e5",
  base08 = "#ff6e67",
  base09 = "#ff9e67",
  base0A = "#fffc67",
  base0B = "#5ffa68",
  base0C = "#60fdff",
  base0D = "#6871ff",
  base0E = "#ca30c7",
  base0F = "#fffc67",
}

M.polish_hl = {
  syntax = {
    Comment = { fg = "#686868" },
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
}

M.type = "dark"

return M
