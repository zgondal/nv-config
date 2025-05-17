local config = require("nvconfig").ui.statusline
local sep_style = config.separator_style
local utils = require "nvchad.stl.utils"

local sep_icons = utils.separators
local separators = (type(sep_style) == "table" and sep_style) or sep_icons[sep_style]

local sep_l = separators["left"]
local sep_r = separators["right"]

local M = {}

M.mode = function()
  if not utils.is_activewin() then
    return ""
  end

  local modes = utils.modes

  local m = vim.api.nvim_get_mode().mode

  local current_mode = "%#St_" .. modes[m][2] .. "Mode#  " .. modes[m][1]
  local mode_sep1 = "%#St_" .. modes[m][2] .. "ModeSep#" .. sep_r
  return current_mode .. mode_sep1 .. "%#ST_EmptySpace#" .. sep_r
end

M.file = function()
  -- get current file name
  local x = utils.file()
  -- get the current working directory
  local cwd = vim.uv.cwd()
  -- get full path of current file
  local fullPath = x[3]
  -- get relative path from cwd of current file
  local relativePath = fullPath:sub(#cwd + 2)
  local name = " " .. relativePath .. (sep_style == "default" and " " or "")
  return "%#St_file# " .. x[1] .. name .. "%#St_file_sep#" .. sep_r
end

M.git = function()
  return "%#St_gitIcons#" .. utils.git()
end

M.lsp_msg = function()
  return "%#St_LspMsg#" .. utils.lsp_msg()
end

M.diagnostics = utils.diagnostics

M.lsp = function()
  return "%#St_Lsp#" .. utils.lsp()
end

M.cwd = function()
  local icon = "%#St_cwd_icon#" .. "󰉋 "
  local name = vim.uv.cwd()
  name = "%#St_cwd_text#" .. " " .. (name:match "([^/\\]+)[/\\]*$" or name) .. " "
  return (vim.o.columns > 85 and ("%#St_cwd_sep#" .. sep_l .. icon .. name)) or ""
end

M.cursor = "%#St_pos_sep#" .. sep_l .. "%#St_pos_icon# %#St_pos_text# %l/%v "
M["%="] = "%="

return function()
  return utils.generate("default", M)
end
