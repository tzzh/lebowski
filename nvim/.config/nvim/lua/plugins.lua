return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("lualine").setup({})
		end,
	},
	"tpope/vim-surround",
	-- { "saadparwaiz1/cmp_luasnip", dependencies = { "L3MON4D3/LuaSnip" } },
	-- { "rafamadriz/friendly-snippets" },
	-- "PaterJason/cmp-conjure",
	-- {
	-- 	"L3MON4D3/LuaSnip",
	-- },
	{ "junegunn/fzf", build = ":call fzf#install()" },
	"junegunn/fzf.vim",
	"junegunn/vim-peekaboo",
	-- "Olical/conjure",
	-- "guns/vim-sexp",
	-- "tpope/vim-sexp-mappings-for-regular-people",
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
			{ "<leader>cf", ":NvimTreeFindFile<CR>" },
		},
	},
	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	"sindrets/diffview.nvim",
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.surround").setup()
		end,
	},
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- calling `setup` is optional for customization
			require("fzf-lua").setup({})
		end,
	},
}
