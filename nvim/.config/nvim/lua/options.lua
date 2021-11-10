local opt = vim.opt
local cmd = vim.api.nvim_command

vim.g.mapleader= " "

--TODO review as some of these date from a very long time ago
opt.number=true
opt.mouse="a"
opt.ignorecase=true
opt.smartcase=true
opt.clipboard="unnamedplus"
opt.inccommand="nosplit"
opt.guicursor=""
opt.termguicolors=true
opt.splitbelow=true
opt.splitright=true
opt.background="dark"
opt.shiftwidth=4
opt.tabstop=4
opt.expandtab=true
opt.cursorline=true

cmd('colorscheme gruvbox')
cmd('filetype plugin indent on')
cmd('syntax on')

-- set groovy syntax for Jenkinsfile
cmd('au BufNewFile,BufRead Jenkinsfile setf groovy')
