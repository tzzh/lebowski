local actions = require "telescope.actions"
require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
      ["<C-h>"] = "which_key",
      ["<C-j>"] = actions.move_selection_next,
      ["<C-k>"] = actions.move_selection_previous,
      ["<esc>"] = actions.close
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

local map = vim.api.nvim_set_keymap
map('n', '<leader>ff', [[<Cmd>lua require('telescope.builtin').find_files({follow=true})<CR>]], {noremap=true})
map('n', '<leader>fb', [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], {noremap=true})
map('n', '<leader>fg', [[<Cmd>lua require('telescope.builtin').live_grep()<CR>]], {noremap=true})
map('n', '<leader>fw', [[<Cmd>lua require('telescope.builtin').grep_string()<CR>]], {noremap=true})
map('n', '<leader>fh', [[<Cmd>lua require('telescope.builtin').help_tags()<CR>]], {noremap=true})
