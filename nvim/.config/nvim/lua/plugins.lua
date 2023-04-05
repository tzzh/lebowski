return {
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
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup()
		end,
		keys = {
			{ "<C-n>", ":NvimTreeToggle<CR>" },
		},
	},
}
