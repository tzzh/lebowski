nnoremap <Leader>g :Rg <C-R><C-W><CR>

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all --ansi'
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
nnoremap <Leader>p :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>m :Maps<CR>
nnoremap <Leader>ev :FZF ~/.config/nvim/<CR>
