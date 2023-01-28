#!/bin/bash

# Store path to the dotfiles folder
DOTFILES_PATH=$(pwd)

ln -s $DOTFILES_PATH/.Xmodmap $HOME/.Xmodmap
ln -s $DOTFILES_PATH/.xinitrc $HOME/.xinitrc
ln -s $DOTFILES_PATH/.vimrc $HOME/.vimrc
ln -s $DOTFILES_PATH/.zshrc $HOME/.zshrc
ln -s $DOTFILES_PATH/.gitconfig $HOME/.gitconfig

mkdir -pv $HOME/.config/alacritty
ln -s $DOTFILES_PATH/.config/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml

mkdir -pv $HOME/.config/i3
ln -s $DOTFILES_PATH/.config/i3/config $HOME/.config/i3/config

mkdir -pv $HOME/.config/i3status
ln -s $DOTFILES_PATH/.config/i3status/config $HOME/.config/i3status/config

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

