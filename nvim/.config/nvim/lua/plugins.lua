return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("lualine").setup({})
		end,
	},
	"tpope/vim-surround",
	"junegunn/vim-peekaboo",
	-- "Olical/conjure",
	-- "guns/vim-sexp",
	-- "tpope/vim-sexp-mappings-for-regular-people",
	{ "luochen1990/rainbow", lazy = false },
	"jaawerth/fennel.vim",
	{ "hashivim/vim-terraform", ft = "terraform" },

	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{ "chr4/nginx.vim", ft = "nginx" },

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
	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = { transparent_mode = true } },
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
			local fzf = require("fzf-lua")
			fzf.setup({
				winopts = {
					preview = {
						default = "bat",
					},
				},
				fzf_opts = {
					["--ansi"] = true,
					["--info"] = "inline-right",
					["--height"] = "100%",
					["--layout"] = "reverse",
					["--keep-right"] = true,
				},
				keymap = {
					builtin = {
						["<C-d>"] = "preview-page-down",
						["<C-u>"] = "preview-page-up",
					},
					fzf = {
						["ctrl-q"] = "select-all+accept",
						["ctrl-a"] = "select-all",
					},
				},
				actions = {
					files = {
						["default"] = fzf.actions.file_edit,
						["ctrl-x"] = fzf.actions.file_split,
						["ctrl-v"] = fzf.actions.file_vsplit,
						["ctrl-q"] = fzf.actions.file_sel_to_qf,
					},
				},
			})
		end,
		keys = {
			{ "<leader>p", "<cmd>lua require('fzf-lua').files()<CR>", desc = "Find files" },
			{ "<leader>b", "<cmd>lua require('fzf-lua').buffers()<CR>", desc = "Find buffers" },
			{ "<leader>ma", "<cmd>lua require('fzf-lua').keymaps()<CR>", desc = "Find keymaps" },
			{
				"<leader>g",
				"<cmd>lua require('fzf-lua').grep_cword()<CR>",
				desc = "Grep word under cursor",
			},
			{ "<leader>gf", "<cmd>lua require('fzf-lua').git_status()<CR>", desc = "Git status files" },
			{
				"<leader>ev",
				"<cmd>lua require('fzf-lua').files({ cwd = '~/.config/nvim/' })<CR>",
				desc = "Edit vim config",
			},
		},
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

	{
		"yetone/avante.nvim",
		build = vim.fn.has("win32") ~= 0
				and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
			or "make",
		event = "VeryLazy",
		opts = {
			provider = "claude",
			selection = {
				hint_display = "none",
			},
			behaviour = {
				auto_set_keymaps = false,
			},
		},
		cmd = {
			"AvanteAsk",
			"AvanteBuild",
			"AvanteChat",
			"AvanteClear",
			"AvanteEdit",
			"AvanteFocus",
			"AvanteHistory",
			"AvanteModels",
			"AvanteRefresh",
			"AvanteShowRepoMap",
			"AvanteStop",
			"AvanteSwitchProvider",
			"AvanteToggle",
		},

		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},

		keys = {
			{ "<leader>aa", "<cmd>AvanteAsk<CR>", desc = "Ask Avante" },
			{ "<leader>ac", "<cmd>AvanteChat<CR>", desc = "Chat with Avante" },
			{ "<leader>ae", "<cmd>AvanteEdit<CR>", desc = "Edit Avante" },
			{ "<leader>af", "<cmd>AvanteFocus<CR>", desc = "Focus Avante" },
			{ "<leader>ah", "<cmd>AvanteHistory<CR>", desc = "Avante History" },
			{ "<leader>am", "<cmd>AvanteModels<CR>", desc = "Select Avante Model" },
			{ "<leader>an", "<cmd>AvanteChatNew<CR>", desc = "New Avante Chat" },
			{ "<leader>ap", "<cmd>AvanteSwitchProvider<CR>", desc = "Switch Avante Provider" },
			{ "<leader>ar", "<cmd>AvanteRefresh<CR>", desc = "Refresh Avante" },
			{ "<leader>as", "<cmd>AvanteStop<CR>", desc = "Stop Avante" },
			{ "<leader>at", "<cmd>AvanteToggle<CR>", desc = "Toggle Avante" },
		},
	},
{
  "MagicDuck/grug-far.nvim",
  opts = { headerMaxWidth = 80 },
  cmd = { "GrugFar", "GrugFarWithin" },
  keys = {
    {
      "<leader>sr",
      function()
        local grug = require("grug-far")
        local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
        grug.open({
          transient = true,
          prefills = {
            filesFilter = ext and ext ~= "" and "*." .. ext or nil,
          },
        })
      end,
      mode = { "n", "x" },
      desc = "Search and Replace",
    },
  },
}
}
