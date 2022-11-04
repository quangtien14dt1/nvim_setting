
call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'lambdalisue/fern.vim'
Plug '907th/vim-auto-save'
Plug 'https://github.com/bfrg/vim-cpp-modern'
Plug 'voldikss/vim-floaterm'
Plug 'https://github.com/neoclide/coc.nvim'	, {'branch': 'release'}
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/preservim/tagbar'
Plug 'https://github.com/sainnhe/gruvbox-material'
Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-cpp'}
Plug 'kdheepak/lazygit.nvim'
Plug 'https://github.com/gkjgh/cobalt'
             
call plug#end()

source $HOME/.config/nvim/basic.vim
source $HOME/.config/nvim/auto_save.vim
source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/fern.vim
source $HOME/.config/nvim/clang.vim
source $HOME/.config/nvim/spector.vim
source $HOME/.config/nvim/float_term.vim
source $HOME/.config/nvim/lazygit.vim







