call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'

Plug 'neovim/nvim-lspconfig'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'Olical/conjure', {'tag': 'v4.5.0', 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'guns/vim-sexp' , { 'for': 'clojure' }

Plug 'luochen1990/rainbow', { 'for': 'clojure' }

Plug 'bakpakin/fennel.vim'

Plug 'kassio/neoterm'

Plug 'tpope/vim-surround'

Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'leafgarland/typescript-vim'

"Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons' " for file icons

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'lewis6991/gitsigns.nvim'
Plug 'vim-test/vim-test'
Plug 'hashivim/vim-terraform'

Plug 'google/vim-jsonnet'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'

Plug 'vimwiki/vimwiki'

call plug#end()

lua <<EOF
require('options')
require('mappings')
EOF
