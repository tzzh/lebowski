local map = vim.api.nvim_set_keymap
local M = {}

map("n", "<space>", "<nop>", { noremap = true })
map("n", "<tab>", "<C-^>", { noremap = true }) -- alternate file

-- quickfix list navigation
map("n", "<leader>j", ":cnext<CR>", { noremap = true })
map("n", "<leader>k", ":cprev<CR>", { noremap = true })

map("x", "p", "pgvy", { noremap = true }) -- paste multiple times

map("n", "<leader>d", [["_d]], { noremap = true }) -- delete without polluting default yank register
map("v", "<leader>d", [["_d]], { noremap = true }) -- delete without polluting default yank register

map("n", "<C-n>", ":nohl<CR>", { noremap = true, silent = true }) -- clear highlighting

map("t", "<Esc>", [[<C-\><C-n>]], { noremap = true }) -- escape terminal mode

local toggle_qf = function()
	for _, win in pairs(vim.fn.getwininfo()) do
		if win["quickfix"] == 1 then
			vim.cmd("cclose")
			return
		end
		vim.cmd("copen")
	end
end

M.toggle_qf = toggle_qf
map("n", "<leader>qf", [[:lua require('mappings').toggle_qf()<CR>]], { noremap = true })
return M
