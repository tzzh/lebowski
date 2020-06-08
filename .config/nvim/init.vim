call plug#begin('~/.local/share/nvim/plugged')
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'scalameta/coc-metals', {'do': 'yarn install --frozen-lockfile'}

"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Plug 'Vigemus/iron.nvim'
"Plug 'vim-python/python-syntax'

" Plug 'tpope/vim-fireplace'
Plug 'Olical/conjure', {'branch': 'develop'}
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'guns/vim-sexp' ", { 'for': 'clojure' }
" Plug 'liquidz/vim-iced', {'for': 'clojure'}
" Plug 'liquidz/vim-iced-coc-source', {'for': 'clojure'}

Plug 'luochen1990/rainbow', { 'for': 'clojure' }

"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'bakpakin/fennel.vim'

Plug 'elixir-editors/vim-elixir'

Plug 'reasonml-editor/vim-reason-plus'

call plug#end()

" luafile $HOME/.config/nvim/plugins.lua

set guicursor=
colorscheme gruvbox 
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

"call deoplete#custom#option('keyword_patterns', {'clojure': '[\w!$%&*+/:<=>?@\^_~\-\.#]*'})
"let g:deoplete#max_list = 10
"call deoplete#custom#option({'max_list': 5})
"call deoplete#custom#option({'omni_patterns': {'clojure': '[\w!$%&*+/:<=>?@\^_~\-\.#]*'}})
"call deoplete#custom#option('max_list', 5)
"#let g:deoplete#sources#jedi#python_path = '/usr/bin/python3'
"#
"#let g:python3_host_prog = '/usr/bin/python3'

nnoremap <C-N> :nohl<CR>


"let g:ale_open_list = 1
let g:ale_linters = {'clojure': ['clj-kondo', 'joker']}
let g:ale_fixers = {}
let g:ale_fixers.python = ['autopep8']
let g:ale_python_autopep8_options = '--max-line-length 300'
let g:ale_python_mypy_options = '--ignore-missing-imports'
let g:ale_python_flake8_executable = 'python3'   " or 'python' for Python 2
let g:ale_python_flake8_options = '-m flake8 --max-line-length 300'

let g:ale_fixers.clojure = ['remove_trailing_lines', 'trim_whitespace']

let g:ale_fixers.javascript = ['eslint', 'remove_trailing_lines', 'trim_whitespace']

let g:ale_linters.go = ['gofmt', 'gobuild', 'golint']
let g:ale_fixers.go = ['gofmt']

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
nnoremap <Leader>g :Rg <C-R><C-W><CR>

" enable jsx syntax in js files (not only jsx)
let g:jsx_ext_required = 0

" Rainbow Parenthesis (for clojure)
let g:rainbow_active = 1
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

tnoremap <Esc> <C-\><C-n>

" COC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <Leader>d  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
let g:coc_global_extensions = ['coc-conjure']


au BufNewFile,BufRead Jenkinsfile setf groovy
