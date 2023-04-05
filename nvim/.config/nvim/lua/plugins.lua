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

vim.g.mapleader = " "
vim.g.sexp_filetypes = "clojure,scheme,lisp,timl,fennel,janet"

require("lazy").setup({
	-- use("lewis6991/impatient.nvim")
	-- use("nvim-lua/plenary.nvim")
	-- use('Olical/aniseed')
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("lualine").setup()
		end,
	},
	"flazz/vim-colorschemes",
	"tpope/vim-surround",
	"neovim/nvim-lspconfig",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"PaterJason/cmp-conjure",
	"onsails/lspkind-nvim",
	--use("ray-x/lsp_signature.nvim")

	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- use({
	-- 	"nvim-treesitter/nvim-treesitter",
	-- 	ensure_installed = {
	-- 		"python",
	-- 		"lua",
	-- 		"vim",
	-- 		"help",
	-- 		"markdown",
	-- 		"terraform",
	-- 		"clojure",
	-- 		"html",
	-- 		"javascript",
	-- 		"typescript",
	-- 	},
	-- 	auto_install = true,
	-- 	run = ":TSUpdate",
	-- })

	{ "junegunn/fzf", build = ":call fzf#install()" },
	"junegunn/fzf.vim",

	{
		"lewis6991/gitsigns.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	-- use("vim-test/vim-test")
	"junegunn/vim-peekaboo",
	-- use("kassio/neoterm")

	"Olical/conjure",
	"guns/vim-sexp",
	"tpope/vim-sexp-mappings-for-regular-people",
	"luochen1990/rainbow",
	"jaawerth/fennel.vim",
	"pangloss/vim-javascript",
	"maxmellon/vim-jsx-pretty",
	"leafgarland/typescript-vim",
	"hashivim/vim-terraform",

	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	"chr4/nginx.vim",

	{
		"kyazdani42/nvim-tree.lua",
		dependencies = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					layout_config = {
						horizontal = {
							preview_cutoff = 0,
						},
					},
				},
			})
		end,
	},
	-- use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	-- use {
	--   "folke/trouble.nvim",
	--   requires = "kyazdani42/nvim-web-devicons",
	--   config = function()
	--     require("trouble").setup {
	--       -- your configuration comes here
	--       -- or leave it empty to use the default settings
	--       -- refer to the configuration section below
	--     }
	--   end
	-- }
})
