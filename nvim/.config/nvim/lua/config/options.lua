-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
opt.completeopt = "menu,popup"
opt.guicursor = ""

vim.g.autoformat = false
-- opt.shiftwidth = 4
-- opt.tabstop = 4
opt.wrap = true

opt.relativenumber = false
