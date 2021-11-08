local map = vim.api.nvim_set_keymap

map('n', '<space>', '<nop>', {noremap=true})
map('n', '<tab>', '<C-^>', {noremap=true}) -- alternate file

-- quickfix list navigation
map('n', '<leader>j', ':cnext<CR>', {noremap=true})
map('n', '<leader>k', ':cprev<CR>', {noremap=true})


map('x', 'p', 'pgvy', {noremap=true}) -- paste multiple times

map('n', '<leader>d', [["_d]], {noremap=true}) -- delete without polluting default yank register
map('v', '<leader>d', [["_d]], {noremap=true}) -- delete without polluting default yank register

map('n', '<C-n>', ':nohl<CR>', {noremap=true, silent=true}) -- clear highlighting

map('t', '<Esc>', [[<C-\><C-n>]], {noremap=true}) -- escape terminal mode
