-- NvChad Theme - Vibrant Terminal
local M = {}

M.base_30 = {
  white = "#ffffff",
  darker_black = "#000000",
  black = "#000000", -- nvim bg
  black2 = "#0a0a0a",
  one_bg = "#1b1d21", -- real bg
  one_bg2 =  "#25272b",
  one_bg3 =  "#2f3135",
  grey =  "#3b3d41",
  grey_fg =  "#45474b",
  grey_fg2 =  "#4f5155",
  light_grey =  "#ccccff",
  red =  "#dc322f",
  baby_pink =  "#ff6b61",
  pink =  "#b729d9",
  line =  "#25272b", -- for lines like vertsplit
  green =  "#56db3a",
  vibrant_green =  "#66ff4a",
  nord_blue =  "#0084d4",
  blue =  "#0084d4",
  yellow =  "#ff8400",
  sun =  "#ffa000",
  purple =  "#b729d9",
  dark_purple =  "#a719c9",
  teal =  "#4dd2e5",
  orange =  "#ff8400",
  cyan =  "#4dd2e5",
  statusline_bg =  "#0a0a0a",
  lightbg =  "#25272b",
  pmenu_bg =  "#0084d4",
  folder_bg =  "#0084d4",
  lavender =  "#d5a3e6",
}

M.base_16 = {
  base00 =  "#000000",
  base01 =  "#1b1d21",
  base02 =  "#25272b",
  base03 =  "#3b3d41",
  base04 =  "#6b6d71",
  base05 =  "#ffffff",
  base06 =  "#f5f5f5",
  base07 =  "#e5e5e5",
  base08 =  "#dc322f",
  base09 =  "#ff8400",
  base0A =  "#ff8400",
  base0B =  "#56db3a",
  base0C =  "#4dd2e5",
  base0D =  "#0084d4",
  base0E =  "#b729d9",
  base0F =  "#ff8400",
}

M.polish_hl = {
  syntax = {
    Comment =  { fg =  "#3b3d41" },
    Conditional =  { fg =  M.base_30.purple },
    Keyword =  { fg =  M.base_30.purple },
    Type =  { fg =  M.base_30.yellow },
    Function =  { fg =  M.base_30.blue },
    String =  { fg =  M.base_30.green },
    Number =  { fg =  M.base_30.orange },
    Operator =  { fg =  M.base_30.purple },
    Constant =  { fg =  M.base_30.cyan },
    Tag =  { fg =  M.base_30.red },
  },
  treesitter =  {
    ["@parameter"] =  { fg =  M.base_30.orange },
    ["@keyword"] =  { fg =  M.base_30.purple },
    ["@string"] =  { fg =  M.base_30.green },
    ["@function"] =  { fg =  M.base_30.blue },
    ["@function.builtin"] =  { fg =  M.base_30.cyan },
    ["@property"] =  { fg =  M.base_30.orange },
    ["@field"] =  { fg =  M.base_30.orange },
    ["@namespace"] =  { fg =  M.base_30.yellow },
  },
  git =  {
    DiffAdd =  { bg =  "#0d300d" },
    DiffDelete =  { bg =  "#300d0d" },
    DiffChange =  { bg =  "#0d1a30" },
    DiffText =  { bg =  "#1a3a5a" },
  },
  visual =  {
    Visual =  { bg =  "#073642",  fg =  "#ffffff" },  --  selection  colors
  },
  cursor =  {
    Cursor =  { fg =  "#000000",  bg =  "#dc322f" },  --  cursor  color
  }
}

M.type =  "dark"

return  M
