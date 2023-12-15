return {
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")

			local lspkind = require("lspkind")

			cmp.setup({

				mapping = {
					["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item()),
					["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item()),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-e>"] = cmp.mapping.close(),
					["<c-y>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Insert,
						select = true,
					}),
				},

				sources = {
					{ name = "nvim_lua" },
					{ name = "nvim_lsp", priority = 10 },
					{ name = "path" },
					{ name = "buffer", priority = 2, keyword_length = 5, max_item_count = 5 },
					-- { name = "conjure" },
					-- { name = "luasnip" },
				},

				formatting = {
					format = lspkind.cmp_format({
						with_text = true,
						menu = {
							buffer = "[Buffer]",
							nvim_lsp = "[LSP]",
							nvim_lua = "[Lua]",
							path = "[Path]",
							luasnip = "[snip]",
						},
					}),
				},
			})
		end,
	},
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"onsails/lspkind-nvim",
}
