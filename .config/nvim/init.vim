call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'Olical/conjure', {'tag': 'v4.5.0'}
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'guns/vim-sexp' ", { 'for': 'clojure' }

Plug 'luochen1990/rainbow', { 'for': 'clojure' }

Plug 'bakpakin/fennel.vim'

Plug 'LnL7/vim-nix'
Plug 'kassio/neoterm'

call plug#end()

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

nnoremap <C-N> :nohl<CR>

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

" neoterm
let g:neoterm_default_mod='belowright' " open terminal in bottom split
let g:neoterm_size=12 " terminal split size
let g:neoterm_autoscroll=1 " scroll to the bottom when running a command
nnoremap <leader>el :TREPLSendLine<cr>j " send current line and move down
vnoremap <leader>es :TREPLSendSelection<cr> " send current line and move down
nnoremap <leader>ef :TREPLSendFile<cr> " send current line and move down
nnoremap <leader>t :Tnew<cr> " new term

" COC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
            
" format current buffer.
nnoremap <Leader>f :call CocAction('format')<CR>

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

"Show doc
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Show all diagnostics.
nnoremap <silent> <Leader>d  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
let g:coc_global_extensions = ['coc-conjure',
                              \'coc-go', 
                              \'coc-python',
                              \'coc-css',
                              \'coc-json',
                              \]


au BufNewFile,BufRead Jenkinsfile setf groovy
