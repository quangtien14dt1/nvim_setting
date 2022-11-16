nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-A> :Rg<CR>
  

function! s:build_quickfix_list(lines)
	call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
	copen
	cc
endfunction

:let g:fzf_layout = { 'down': '40%' }
:let g:fzf_action = {'ctrl-t': 'tab split','ctrl-s': 'split','ctrl-v': 'vsplit'}
