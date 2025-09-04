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

  {
    "linrongbin16/gitlinker.nvim",
    cmd = "GitLink",
    opts = {},
    keys = {
      { "<leader>gy", "<cmd>GitLink<cr>", mode = { "n", "v" }, desc = "Yank git link" },
      { "<leader>go", "<cmd>GitLink!<cr>", mode = { "n", "v" }, desc = "Open git link" },
    },
  },

  -- {
  --   "zbirenbaum/copilot.lua",
  -- },

-- {
--   "yetone/avante.nvim",
--   event = "VeryLazy",
--   version = false, -- Never set this value to "*"! Never!
--   opts = {
--     -- add any opts here
--     -- for example
--     provider = "copilot",
--     providers = {
--       openai = {
--         endpoint = "https://api.openai.com/v1",
--         model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
--         extra_request_body = {
--           timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
--           temperature = 0.75,
--           max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
--           --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
--         },
--       },
--     },
--   },
--   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
--   build = "make",
--   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
--   dependencies = {
--     "nvim-treesitter/nvim-treesitter",
--     "nvim-lua/plenary.nvim",
--     "MunifTanjim/nui.nvim",
--     --- The below dependencies are optional,
--     "echasnovski/mini.pick", -- for file_selector provider mini.pick
--     -- "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
--     "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
--     "ibhagwan/fzf-lua", -- for file_selector provider fzf
--     "stevearc/dressing.nvim", -- for input provider dressing
--     "folke/snacks.nvim", -- for input provider snacks
--     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
--     -- "zbirenbaum/copilot.lua", -- for providers='copilot'
--     {
--       -- support for image pasting
--       "HakonHarnes/img-clip.nvim",
--       event = "VeryLazy",
--       opts = {
--         -- recommended settings
--         default = {
--           embed_image_as_base64 = false,
--           prompt_for_file_name = false,
--           drag_and_drop = {
--             insert_mode = true,
--           },
--           -- required for Windows users
--           use_absolute_path = true,
--         },
--       },
--     },
--     {
--       -- Make sure to set this up properly if you have lazy=true
--       'MeanderingProgrammer/render-markdown.nvim',
--       opts = {
--         file_types = { "markdown", "Avante" },
--       },
--       ft = { "markdown", "Avante" },
--     },
--   },
-- }
}
