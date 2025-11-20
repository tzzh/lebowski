local servers = { "terraformls", "html", "clojure_lsp", "bashls", "vtsls", "jsonls", "yamlls", "sqls", "ruby_lsp" }

require("mason").setup()

local Job = require("plenary.job")

-- Set up global LSP keymaps using LspAttach autocommand
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local bufnr = ev.buf
		local client = vim.lsp.get_client_by_id(ev.data.client_id)

		-- Enable completion triggered by <c-x><c-o>
		vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Mappings.
		local opts = { noremap = true, silent = true, buffer = bufnr }

		-- See `:help vim.lsp.*` for documentation on any of the below functions
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
		vim.keymap.set("n", "<leader>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)

		-- Disable semantic highlighting for basedpyright
		if client and client.name == "basedpyright" then
			client.server_capabilities.semanticTokensProvider = nil
		end
	end,
})

-- Set up global capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Configure servers (nvim-lspconfig provides the base configs via vim.lsp.config)
-- We just need to add our custom settings
for _, lsp in ipairs(servers) do
	if vim.lsp.config[lsp] then
		vim.lsp.config[lsp] = vim.tbl_deep_extend("force", vim.lsp.config[lsp], {
			capabilities = capabilities,
		})
	end
end

-- Configure lua_ls with specific settings
if vim.lsp.config.lua_ls then
	vim.lsp.config.lua_ls = vim.tbl_deep_extend("force", vim.lsp.config.lua_ls, {
		capabilities = capabilities,
		settings = {
			Lua = {
				workspace = { checkThirdParty = false },
				telemetry = { enable = false },
			},
		},
	})
end

-- Configure basedpyright
local function setup_basedpyright_with_venv(venv_path)
	if vim.lsp.config.basedpyright then
		vim.lsp.config.basedpyright = vim.tbl_deep_extend("force", vim.lsp.config.basedpyright, {
			capabilities = capabilities,
			settings = {
				python = {
					pythonPath = venv_path .. "/bin/python",
				},
			},
		})
	end
end

-- Check for Poetry first
Job:new({
	command = "poetry",
	args = { "env", "info", "--path" },
	on_exit = vim.schedule_wrap(function(j, return_val)
		if return_val == 0 then
			-- Poetry found, use its venv
			local venv_path = j:result()[1]
			setup_basedpyright_with_venv(venv_path)
		else
			-- Poetry not found, check for Pipenv
			Job:new({
				command = "pipenv",
				args = { "--venv" },
				on_exit = vim.schedule_wrap(function(j2, return_val2)
					if return_val2 == 0 then
						-- Pipenv found, use its venv
						local venv_path = vim.inspect(j2:result()[1]):sub(2, -2)
						setup_basedpyright_with_venv(venv_path)
					else
						-- Neither found, use default basedpyright config
						if vim.lsp.config.basedpyright then
							vim.lsp.config.basedpyright = vim.tbl_deep_extend("force", vim.lsp.config.basedpyright, {
								capabilities = capabilities,
							})
						end
					end
				end),
			}):start()
		end
	end),
}):start()

-- Enable all configured LSP servers
for _, lsp in ipairs(servers) do
	vim.lsp.enable(lsp)
end

vim.lsp.enable("lua_ls")
vim.lsp.enable("basedpyright")
