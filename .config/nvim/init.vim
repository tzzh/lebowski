call plug#begin('~/.local/share/nvim/plugged')
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
call plug#end()

set guicursor=
" colorscheme gruvbox 
set background=dark
set number

set mouse=a
filetype plugin indent on
syntax on
set shiftwidth=4 tabstop=4 expandtab
set ignorecase
set smartcase
set clipboard=unnamedplus

set inccommand=nosplit

"paste multiple times
xnoremap p pgvy

nnoremap <C-H> :tabprev<CR>
nnoremap <C-L> :tabnext<CR>

"More natural spliting
set splitbelow
set splitright

"Format JSON in a readable way
com! FormatJSON %!python -m json.tool

let g:deoplete#enable_at_startup = 1
"#let g:deoplete#sources#jedi#python_path = '/usr/bin/python3'
"#
"#let g:python3_host_prog = '/usr/bin/python3'

nnoremap <C-N> :nohl<CR>

let g:ale_fixers = {}
let g:ale_fixers.python = ['autopep8']
let g:ale_python_autopep8_options = '--max-line-length 300'
let g:ale_python_mypy_options = '--ignore-missing-imports'
let g:ale_python_flake8_executable = 'python3'   " or 'python' for Python 2
let g:ale_python_flake8_options = '-m flake8 --max-line-length 300'

nnoremap <Leader>f :ALEFix<CR>
nnoremap <Leader>l :lopen<CR>
nnoremap <Leader>c :lclose<CR>

" enable max python highlighting
let g:python_highlight_all = 1

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
nnoremap <C-P> :FZF<CR>
nnoremap <C-B> :Buffers<CR>

" Grep
nnoremap <Leader>r :Rg <C-R><C-W><CR>

" enable jsx syntax in js files (not only jsx)
let g:jsx_ext_required = 0

tnoremap <Esc> <C-\><C-n>
