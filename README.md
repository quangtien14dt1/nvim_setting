# VIM_SETUP_PYTHON_C-C-
my own setting for coding c/c++ and python

* cài đặt vim-plug làm trình quản lí plugins trên nvim : 
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

* tạo folder đặt config file và plugin: cd ~/.config && mkdir nvim

* cài đặt ppa mới nhất cho neovim:

* sudo add-apt-repository ppa:neovim-ppa/stable sudo apt update

* sudo apt-get install neovim

* kiểm tra trắc chắn phiên bản hiện tại của nvim lớn hơn 0.5.0 ( cài đặt node và python sẽ tương thích hơn mới version mới )
  :checkhealth lệnh này để kiểm tra xem nvim còn thiếu những gì 
    -> cài nvm => nodejs lastest(global) => global npm => global yarn cài npm neovim : sudo npm install -g neovim (global)
    
* sudo apt-get install ruby-full cài đặt gem và ruby sudo gem install neovim

* cài python3 => pip3 => neovim(package) => pyvim (package)

* cài python2 => pip2 => neovim => pyvim

vào thư mục nvim theo đường dẫn ./config/nvim

git clone https://github.com/quangtienrikkeisoft/nvim- (nvim setup for c++ ,debugger(GDB) + vscode-cpptool (microsoft) ,memleak check(vangrind))
:PlugUpdate ( date package )

:PlugInstall ~/.config/nvim/autoload/plugged (reinstall package)

:PlugUpgrade ( update package version and reinstall )

* move to config/plugged/autoload/coc/ 
    => gõ yarn install 
    noted: coclide : là 1 nhóm plugin được gói chung và coc-nvim bao gồm tất cả mọi ứng dụng liên quan trong vim , viết và chạy dựa trên nodejs , mọi                plugin đều require nodejs , có thể sẽ không được nhanh lắm khi so với các ứng dụng viết bằng nvim-command , c/c++ hoặc lua)

* cài đặt nerdfont
    sudo mkdir -p ~/.local/share/fonts
    cd ~/.local/share/fonts
    curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
    
    
    
    
set -g default-terminal "screen-256color"

# change default tmux 

set -g prefix C-a
unbind C-b
bind-key C-a send-prefix

# change keybind for splitting windows
unbind %
bind | split-window -h

unbind '"'
bind - split-window -v

# change key for auto reload setting tmux
unbind r
bind r source-file ~/.tmux.conf

# bind key for resize tmux pane
bind -r j resize-pane -D 5
bind -r k resize-pane -U 5
bind -r l resize-pane -R 5
bind -r h resize-pane -L 5

# key bind for maximizing and minimizing 
bind -r m resize-pane -Z

# enable the mouse in tmux
set -g mouse on

# config vim movement for tmux 
set-window-option -g mode-keys vi

bind-key -T copy-mode-vi 'v' send -X begin-selection # start selecting text with "v"
bind-key -T copy-mode-vi 'y' send -X copy-selection # copy text with "y"

unbind -T copy-mode-vi MouseDragEnd1Pane # don't exit copy mode after dragging with mouse

# tpm plugin
set -g @plugin 'tmux-plugins/tpm'

# list of tmux plugins
set -g @plugin 'christoomey/vim-tmux-navigator' # for navigating panes and vim/nvim with Ctrl-hjkl
# set -g @plugin 'jimeh/tmux-themepack' # to configure tmux theme
set -g @plugin 'tmux-plugins/tmux-resurrect' # persist tmux sessions after computer restart
set -g @plugin 'tmux-plugins/tmux-continuum' # automatically saves sessions for you every 15 minutes

# set -g @themepack 'powerline/default/cyan' # use this theme for tmux

set -g @resurrect-capture-pane-contents 'on' # allow tmux-ressurect to capture pane contents
set -g @continuum-restore 'on' # enable tmux-continuum functionality

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
