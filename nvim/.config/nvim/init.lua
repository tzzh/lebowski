local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.loaded_python3_provider = 0

vim.g.rainbow_active = 0
vim.g.mapleader = " "
vim.g.sexp_filetypes = "clojure,scheme,lisp,timl,fennel,janet"

require("lazy").setup("plugins")
require("options")
require("mappings")
