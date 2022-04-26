local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap = false
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	packer_bootstrap = true
end

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("lualine").setup()
		end,
	})
	use("flazz/vim-colorschemes")
	use("tpope/vim-surround")

	use("neovim/nvim-lspconfig")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")

	use("onsails/lspkind-nvim")
	--use("ray-x/lsp_signature.nvim")

	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use({ "junegunn/fzf", run = ":call fzf#install()" })
	use("junegunn/fzf.vim")

	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use("vim-test/vim-test")
	use("junegunn/vim-peekaboo")
	use("kassio/neoterm")

	use("Olical/conjure")
	use("guns/vim-sexp")
	use("tpope/vim-sexp-mappings-for-regular-people")
	use("luochen1990/rainbow")
	use("bakpakin/fennel.vim")

	use("pangloss/vim-javascript")
	use("maxmellon/vim-jsx-pretty")
	use("leafgarland/typescript-vim")

	use("hashivim/vim-terraform")
	use("google/vim-jsonnet")

	use({"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
    })
	use("chr4/nginx.vim")

	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
	})
	-- use {
	--   "folke/trouble.nvim",
	--   requires = "kyazdani42/nvim-web-devicons",
	--   config = function()
	--     require("trouble").setup {
	--       -- your configuration comes here
	--       -- or leave it empty to use the default settings
	--       -- refer to the configuration section below
	--     }
	--   end
	-- }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
