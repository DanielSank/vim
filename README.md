# vim
My vim configuration

## Installation

1. `$ git clone git@github.com:Danielsank/vim.git ~/.vim`

1. `$ ln -s ~/.vim/vimrc ~/.vimrc`

1. Install plugins: reload `.vimrc` and do `:PlugInstall`.

1. Compile `YouCompleteMe` according to its own docs.


## Install neovim

1. Download app image from https://github.com/neovim/neovim/releases
1.
    ```
    sudo mv neovim.appimage /usr/local/bin/nvim
    sudo chmod a+rx /usr/local/bin/nvim
    ```
1. Set up NPM
    ```
    sudo apt-get install npm
    sudo npm -g install pyright
    ```
1. Symlink neovim config directory to this repo
    ```
    cd ~/.config
    ln -s ~/.vim/nvim nvim
    ```
1. Start neovim with `nvim`, and run `:PlugUpgrade` and `:PlugInstall`.
