local servers = { "terraformls", "html", "clojure_lsp", "bashls", "vtsls", "jsonls", "yamlls" }

require("mason").setup()
require("mason-lspconfig").setup({ ensure_installed = servers })

require("neodev").setup({})

local nvim_lsp = require("lspconfig")
local Job = require("plenary.job")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

	--require "lsp_signature".on_attach()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		},
	})
end

local venv_path
Job:new({
	command = "pipenv",
	args = { "--venv" },
	on_exit = vim.schedule_wrap(function(j, return_val)
		if return_val == 0 then
			venv_path = vim.inspect(j:result()[1]):sub(2, -2)
			nvim_lsp.pyright.setup({
				-- cmd = { nvm_bin_dir .. "pyright-langserver", "--stdio" },
				on_attach = on_attach,
				settings = {
					python = {
						pythonPath = venv_path .. "/bin/python",
					},
				},
			})
		else
			nvim_lsp.pyright.setup({ on_attach = on_attach })
		end
	end),
}):start()

Job:new({
	command = "poetry",
	args = { "env", "info", "--path" },
	on_exit = vim.schedule_wrap(function(j, return_val)
		if return_val == 0 then
			venv_path = j:result()[1]
			nvim_lsp.pyright.setup({
				on_attach = on_attach,
				settings = {
					python = {
						pythonPath = venv_path .. "/bin/python",
					},
				},
			})
		else
			nvim_lsp.pyright.setup({ on_attach = on_attach })
		end
	end),
}):start()

require("lspconfig").lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = { Lua = {
		workspace = { checkThirdParty = false },
		telemetry = { enable = false },
	} },
})

local M = {}
M.list_fixtures = function()
	Job:new({
		command = venv_path .. "/bin/pytest",
		args = { "--fixtures", "-v" },
		on_exit = function(j, return_val)
			if return_val == 0 then
				for _, line in ipairs(j:result()) do
					local pattern = "^([%w_]*) .*%-%- (%S*):(%d*)$"
					local i, _, fixture, file, linenr = string.find(line, pattern)
					if i ~= nil then
						print(fixture, file, linenr)
					end
				end
			end
		end,
	}):sync()
end

return M
