-- NvChad Theme - Dark Version
local M = {}

M.base_30 = {
  white = "#ffffff",
  darker_black = "#12141a",
  black = "#16181a", --  nvim bg
  black2 = "#1a1c1e",
  one_bg = "#242628", -- real bg of onedark
  one_bg2 = "#2e3032",
  one_bg3 = "#383a3c",
  grey = "#4e5054",
  grey_fg = "#5c5e62",
  grey_fg2 = "#69696d",
  light_grey = "#7b8496",
  red = "#ff6e5e",
  baby_pink = "#ff8e7e",
  pink = "#ff5ea0",
  line = "#2c2e30", -- for lines like vertsplit
  green = "#5eff6c",
  vibrant_green = "#7eff89",
  nord_blue = "#5ea1ff",
  blue = "#5ef1ff",
  yellow = "#f1ff5e",
  sun = "#ffdd7e",
  purple = "#bd5eff",
  dark_purple = "#a84eff",
  teal = "#5ef1ff",
  orange = "#ffbd5e",
  cyan = "#5ef1ff",
  statusline_bg = "#1e2124",
  lightbg = "#2a2c2e",
  pmenu_bg = "#5ef1ff",
  folder_bg = "#5ea1ff",
  lavender = "#d485ff",
}

M.base_16 = {
  base00 = "#16181a",
  base01 = "#1e2124",
  base02 = "#282a2e",
  base03 = "#3c4048",
  base04 = "#7b8496",
  base05 = "#ffffff",
  base06 = "#eaeaea",
  base07 = "#5ef1ff",
  base08 = "#ff6e5e",
  base09 = "#ffbd5e",
  base0A = "#f1ff5e",
  base0B = "#5eff6c",
  base0C = "#5ef1ff",
  base0D = "#5ea1ff",
  base0E = "#bd5eff",
  base0F = "#ff5ea0",
}

M.polish_hl = {
  syntax = {
    Conditional = { fg = M.base_30.nord_blue },
    Tag = { fg = M.base_30.white },
    Statement = { fg = M.base_30.purple },
    Type = { fg = M.base_30.yellow },
  },
}

M.type = "dark"

-- Optional: Uncomment below line to override another theme
-- M = require("base46").override_theme(M, "your_base_theme_name")

return M
