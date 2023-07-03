
:set number
:set relativenumber
:set autoindent
:set tabstop=2
:set shiftwidth=4
:set smarttab
:set fileencodings=ucs-bom,utf-8,sjis,default
:set background=dark
:set cmdheight=1
:set nobackup
:set nowritebackup
:set updatetime=300
:set signcolumn=yes
:set wildmode=list:longest,list:full
:set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__

call plug#begin('~/.config/nvim/autoload/plugged')
Plug 'lambdalisue/fern.vim'
Plug '907th/vim-auto-save'
Plug 'https://github.com/bfrg/vim-cpp-modern'
Plug 'https://github.com/neoclide/coc.nvim'	, {'branch': 'release'}
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/preservim/tagbar'
Plug 'https://github.com/sainnhe/gruvbox-material'
Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-cpp'}
Plug 'kdheepak/lazygit.nvim'
Plug 'ilyachur/cmake4vim'
call plug#end()


" fast mapping for changing inside key '' " () {}  
for char in [ '_', '.', ':', ',', ';', '<bar>', '/', '<bslash>', '*', '+', '%' ] 
  execute 'xnoremap i' . char . ' :<C-u>normal! T' . char . 'vt' . char . '<CR>'
  execute 'onoremap i' . char . ' :normal vi' . char . '<CR>'
  execute 'xnoremap a' . char . ' :<C-u>normal! F' . char . 'vf' . char . '<CR>'
  execute 'onoremap a' . char . ' :normal va' . char . '<CR>'
endfor

:colorscheme gruvbox-material
:let $BAT_THEME='gruvbox-material'
:let g:python3_host_prog = "/usr/bin/python3"
:let g:auto_save_events = ["InsertLeave", "TextChanged"]								" event that activate save action 
:let g:auto_save = 1 																										" enable auto_save
:let g:fern#renderer#default#collapsed_symbol = '+'											" 
:let g:fern#renderer#default#expanded_symbol  = '-'											" 
:let g:fern#renderer#default#root_symbol      = '~'											" 
:let g:clang_format#style_options = {																		" clangd server formatted
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++20"}
:let mapleader=" "																											" mapping leader key = space
:let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-tsserver', 'coc-clangd']	
:let g:fern#disable_default_mappings   	=  	1
:let g:fern#disable_drawer_auto_quit   	= 	1
:let g:fern#disable_viewer_hide_cursor 	= 	1
:let g:fern#window_selector_use_popup 	= 	1
:let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path '**/node_modules/**' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

map <esc> :noh <CR>

nnoremap <silent>? :call ShowDocumentation()<CR>												" key mapping ? for ShowDocumentation
nnoremap <silent> <C-p> :Files<CR>																			" Ctrl + p for search Files
nnoremap <silent> <C-A> :Rg<CR>																					" Ctrl + A for search Grep
nnoremap <leader>gg :LazyGit																						" Space + gg for lazygit 
nnoremap <tab>h :tabr<cr>																								"	Tab right 
nnoremap <tab>l :tabl<cr>																								" Tab left 
nnoremap <tab>j :tabp<cr>																								" Tab 
nnoremap <tab>n :tabn<cr>																								" Tab next
nnoremap <tab>c :tabnew<cr>																							" Tab new 
nnoremap <tab>d :tabc<cr>																								" Tab cancel
noremap 	H ^																														" Shift + H goto max right line 
noremap 	L g_																													" Shift + L goto lax left line
noremap 	J 5j																													" Shift + J jump 5 line normal mode 
noremap 	K 5k																													" Shift + K kick 5 line normal mode 
nnoremap 	j jzz																													" 
nnoremap 	k kzz																													" 
noremap <C-t> :Fern . -drawer -reveal=% -toggle -width=33<CR><C-w>=			"
vnoremap 	K 5k																													" Shift + K kick 5 line at visual mode
vnoremap 	J 5j																													"	Shift + J jump 5 line at visual mode

nmap <F2> :TagbarToggle<CR>																							" TagbarToggle 
nmap <silent> [g <Plug>(coc-diagnostic-prev)														" go back diagnostic
nmap <silent> ]g <Plug>(coc-diagnostic-next)														" go next diagnostic
nmap <silent> gd <Plug>(coc-definition)																	" CocAction goto defenition 
nmap <silent> gy <Plug>(coc-type-definition)														" CocAction goto type definition 
nmap <silent> gi <Plug>(coc-implementation)															" CocAction goto implementation 
nmap <silent> gr <Plug>(coc-references)																	" CocAction show all references of element 
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


nmap <leader>rn <Plug>(coc-rename)
nmap <leader>f  <Plug>(coc-format-selected)
xmap <leader>f  <Plug>(coc-format-selected)


augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END

function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
  
  nmap <buffer> c <Plug>(fern-action-new-path)
  nmap <buffer> r <Plug>(fern-action-rename)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> R <Plug>(fern-action-reload)
  nmap <buffer> H <Plug>(fern-action-hidden-toggle)

  nmap <buffer> s <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  
  nmap <buffer> <nowait> h <Plug>(fern-action-hidden:toggle)
  nmap <buffer> <nowait> < <Plug>(fern-action-leave)
  nmap <buffer> <nowait> > <Plug>(fern-action-enter)
endfunction

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('?', 'in')
  endif
endfunction










