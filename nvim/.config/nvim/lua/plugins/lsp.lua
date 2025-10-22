return {
	"neovim/nvim-lspconfig", -- Provides default configs for vim.lsp.config in 0.11+
	"williamboman/mason.nvim",
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
