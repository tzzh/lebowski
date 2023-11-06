return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			auto_install = true,
			sync_install = false,

			highlight = {
				enable = true, -- false will disable the whole extension
			},
			autopairs = {
				enable = true,
			},
			indent = { enable = true },

			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
		})
	end,
}
