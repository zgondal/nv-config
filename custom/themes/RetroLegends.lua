-- NvChad Theme - Green Matrix
local M = {}

M.base_30 = {
  white = "#f2fff2",
  darker_black = "#050505",
  black = "#0d0d0d", -- nvim bg
  black2 = "#151515",
  one_bg = "#262626", -- real bg
  one_bg2 = "#303030",
  one_bg3 = "#3a3a3a",
  grey = "#4c594c",
  grey_fg = "#566356",
  grey_fg2 = "#606d60",
  light_grey = "#bfe6bf",
  red = "#ff6666",
  baby_pink = "#ff8f8f",
  pink = "#e666ff",
  line = "#303030", -- for lines like vertsplit
  green = "#45eb45",
  vibrant_green = "#59ff59",
  nord_blue = "#4c80ff",
  blue = "#4066f2",
  yellow = "#f7bf2b",
  sun = "#ffd933",
  purple = "#bf4cf2",
  dark_purple = "#af3ce2",
  teal = "#40d9e6",
  orange = "#f7bf2b",
  cyan = "#59e6ff",
  statusline_bg = "#151515",
  lightbg = "#303030",
  pmenu_bg = "#4066f2",
  folder_bg = "#4066f2",
  lavender = "#d18cff",
}

M.base_16 = {
  base00 = "#0d0d0d",
  base01 = "#262626",
  base02 = "#303030",
  base03 = "#4c594c",
  base04 = "#8a9c8a",
  base05 = "#45eb45", -- foreground
  base06 = "#59ff59",
  base07 = "#f2fff2",
  base08 = "#ff6666",
  base09 = "#f7bf2b",
  base0A = "#ffd933",
  base0B = "#45eb45",
  base0C = "#40d9e6",
  base0D = "#4066f2",
  base0E = "#bf4cf2",
  base0F = "#f7bf2b",
}

M.polish_hl = {
  syntax = {
    Comment = { fg = "#4c594c" },
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
    DiffAdd = { bg = "#1a331a" },
    DiffDelete = { bg = "#331a1a" },
    DiffChange = { bg = "#1a2a33" },
    DiffText = { bg = "#2a3a4a" },
  },
  visual = {
    Visual = { bg = "#336633", fg = "#f2fff2" }, -- selection colors
  },
  cursor = {
    Cursor = { fg = "#0d0d0d", bg = "#45eb45" }, -- cursor color
  }
}

M.type = "dark"

return M
