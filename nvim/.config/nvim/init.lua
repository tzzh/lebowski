local fmt = string.format
local execute = vim.api.nvim_command
local fn = vim.fn

local impatient_path = fn.stdpath("data") .. "/site/pack/packer/start/impatient.nvim"

if fn.empty(fn.glob(impatient_path)) > 0 then
    execute(fmt("!git clone https://github.com/%s/%s %s", "lewis6991", "impatient.nvim", impatient_path))
end

require('impatient')
require('plugins')
require('options')
require('mappings')
