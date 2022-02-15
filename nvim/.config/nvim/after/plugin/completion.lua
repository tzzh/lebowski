local cmp = require("cmp")

local lspkind = require("lspkind")

cmp.setup({

	mapping = {
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
	},

	formatting = {
		format = lspkind.cmp_format({
			with_text = true,
			menu = {
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[Lua]",
				path = "[Path]",
				--    luasnip = "[snip]",
			},
		}),
	},
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
