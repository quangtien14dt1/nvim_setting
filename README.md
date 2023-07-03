# VIM_SETUP_PYTHON_C-C-
my own setting for coding c/c++ and python

* cài đặt vim-plug làm trình quản lí plugins trên nvim : 
* tạo folder đặt config file và plugin: cd ~/.config && mkdir nvim
* cài đặt ppa mới nhất cho neovim:
* sudo add-apt-repository ppa:neovim-ppa/stable sudo apt update
* sudo apt-get install neovim
* 0.5.0 ( cài đặt node và python sẽ tương thích hơn mới version mới )
* sudo apt-get install ruby-full cài đặt gem và ruby sudo gem install neovim
* cài python3 => pip3 => neovim(package) => pyvim (package)
* cài python2 => pip2 => neovim => pyvim
* vào thư mục nvim theo đường dẫn ./config/nvim - git clone https://github.com/quangtienrikkeisoft/nvim
* move to config/plugged/autoload/coc/  => gõ yarn install 
* cài đặt nerdfont
    sudo mkdir -p ~/.local/share/fonts
    cd ~/.local/share/fonts
    curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
    
    
    
