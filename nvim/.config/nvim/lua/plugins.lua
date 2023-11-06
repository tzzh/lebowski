return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("lualine").setup({})
		end,
	},
	"tpope/vim-surround",
	{ "saadparwaiz1/cmp_luasnip", dependencies = { "L3MON4D3/LuaSnip" } },
	-- { "rafamadriz/friendly-snippets" },
	-- "PaterJason/cmp-conjure",
	{
		"L3MON4D3/LuaSnip",
	},
	{ "junegunn/fzf", build = ":call fzf#install()" },
	"junegunn/fzf.vim",
	"junegunn/vim-peekaboo",
	-- "Olical/conjure",
	"guns/vim-sexp",
	"tpope/vim-sexp-mappings-for-regular-people",
	{ "luochen1990/rainbow", lazy = false },
	"jaawerth/fennel.vim",
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
	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
}
