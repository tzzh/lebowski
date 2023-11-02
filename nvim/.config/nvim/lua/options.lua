local opt = vim.opt
local cmd = vim.api.nvim_command

vim.g.rainbow_active = 1
vim.g.mapleader = " "

--TODO review as some of these date from a very long time ago
opt.mouse = "a"

opt.ignorecase = true
opt.smartcase = true

opt.clipboard = "unnamedplus"
opt.inccommand = "nosplit"

opt.guicursor = ""
opt.termguicolors = true
opt.background = "dark"

opt.splitbelow = true
opt.splitright = true

opt.shiftwidth = 4
opt.tabstop = 4
opt.expandtab = true

opt.number = true
opt.cursorline = true

--opt.title = true

cmd("colorscheme gruvbox")
cmd("filetype plugin indent on")
cmd("syntax on")

-- set groovy syntax for Jenkinsfile
cmd("au BufNewFile,BufRead Jenkinsfile setf groovy")
