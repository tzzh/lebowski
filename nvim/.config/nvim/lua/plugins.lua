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

	use("vim-airline/vim-airline")
	use("flazz/vim-colorschemes")
	use("tpope/vim-surround")

	use("neovim/nvim-lspconfig")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")

	use("onsails/lspkind-nvim")

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

	use("numToStr/Comment.nvim")
	use("chr4/nginx.vim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
