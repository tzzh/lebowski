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
	use("hrsh7th/cmp-nvim-lsp")

	use({ "junegunn/fzf", run = ":call fzf#install()" })
	use("junegunn/fzf.vim")

	use("lewis6991/gitsigns.nvim")
	use("vim-test/vim-test")
	use("junegunn/vim-peekaboo")
	use("vimwiki/vimwiki")
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

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
