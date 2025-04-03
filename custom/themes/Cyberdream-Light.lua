-- NvChad Theme - Light Version
local M = {}

M.base_30 = {
  white = "#16181a",
  darker_black = "#f0f0f0",
  black = "#ffffff", --  nvim bg
  black2 = "#f0f0f0",
  one_bg = "#eaeaea", -- real bg of onedark
  one_bg2 = "#e0e0e0",
  one_bg3 = "#d4d4d4",
  grey = "#c0c0c0",
  grey_fg = "#b0b0b0",
  grey_fg2 = "#a0a0a0",
  light_grey = "#7b8496",
  red = "#d11500",
  baby_pink = "#f44336",
  pink = "#f40064",
  line = "#e0e0e0", -- for lines like vertsplit
  green = "#008b0c",
  vibrant_green = "#00b412",
  nord_blue = "#0057d1",
  blue = "#008c99",
  yellow = "#997b00",
  sun = "#c09000",
  purple = "#a018ff",
  dark_purple = "#8200d8",
  teal = "#008c99",
  orange = "#d17c00",
  cyan = "#008c99",
  statusline_bg = "#eaeaea",
  lightbg = "#d8d8d8",
  pmenu_bg = "#008c99",
  folder_bg = "#0057d1",
  lavender = "#9045c0",
}

M.base_16 = {
  base00 = "#ffffff",
  base01 = "#eaeaea",
  base02 = "#d8d8d8",
  base03 = "#acacac",
  base04 = "#7b8496",
  base05 = "#16181a",
  base06 = "#101214",
  base07 = "#008c99",
  base08 = "#d11500",
  base09 = "#d17c00",
  base0A = "#997b00",
  base0B = "#008b0c",
  base0C = "#008c99",
  base0D = "#0057d1",
  base0E = "#a018ff",
  base0F = "#f40064",
}

M.polish_hl = {
  syntax = {
    Conditional = { fg = M.base_30.nord_blue },
    Tag = { fg = M.base_30.white },
    Statement = { fg = M.base_30.purple },
    Type = { fg = M.base_30.yellow },
  },
}

M.type = "light"

-- Optional: Uncomment below line to override another theme
-- M = require("base46").override_theme(M, "your_base_theme_name")

return M
