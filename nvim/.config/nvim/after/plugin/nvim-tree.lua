require'nvim-tree'.setup {}

local map = vim.api.nvim_set_keymap
map("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent =true })
