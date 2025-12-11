-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<tab>", "<C-^>", { noremap = true }) -- alternate file
vim.keymap.set("n", "<leader>cp", ':let @* = expand("%")<CR>', { noremap = true }) -- copy current path
