local map = vim.api.nvim_set_keymap

vim.g.neoterm_default_mod='belowright' -- open terminal in bottom split
vim.g.neoterm_size=12  --  terminal split size
vim.g.neoterm_autoscroll=1 -- scroll to the bottom when running a command
map('n', '<leader>el', ':TREPLSendLine<cr>j', {noremap=true})
map('v', '<leader>es', ':TREPLSendSelection<cr>', {noremap=true})
map('n', '<leader>ef', ':TREPLSendFile<cr>j', {noremap=true})
map('n', '<leader>t', ':Ttoggle<cr>', {noremap=true})
