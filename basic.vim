:set number
:set relativenumber
:set autoindent
:set tabstop=2
:set shiftwidth=4
:set smarttab
:set fileencodings=ucs-bom,utf-8,sjis,default
:set background=dark
:set cmdheight=1

nnoremap <Up> <nop>
nnoremap <Down> <nop> 
nnoremap <Left> <nop>
nnoremap <Right> <nop>

nnoremap <tab>h :tabr<cr>
nnoremap <tab>l :tabl<cr>
nnoremap <tab>j :tabp<cr>
nnoremap <tab>n :tabn<cr>
nnoremap <tab>c :tabnew<cr>
nnoremap <tab>d :tabc<cr>

noremap H ^
noremap L g_
noremap J 5j
vnoremap J 5j
noremap K 5k
vnoremap K 5k
nnoremap j jzz
nnoremap k kzz


map <esc> :noh <CR>
nmap <F2> :TagbarToggle<CR>

:colorscheme gruvbox-material
"colorscheme PaperColor
"colorscheme cobalt

for char in [ '_', '.', ':', ',', ';', '<bar>', '/', '<bslash>', '*', '+', '%' ]
  execute 'xnoremap i' . char . ' :<C-u>normal! T' . char . 'vt' . char . '<CR>'
  execute 'onoremap i' . char . ' :normal vi' . char . '<CR>'
  execute 'xnoremap a' . char . ' :<C-u>normal! F' . char . 'vf' . char . '<CR>'
  execute 'onoremap a' . char . ' :normal va' . char . '<CR>'
endfor

:let g:python3_host_prog = "/usr/bin/python3"


