#!/bin/bash

source ./utils/symlink.sh

declare -a dotfiles=(
	# Visual Studio Code
	".config/Code/User/settings.json"
	".config/Code/User/keybindings.json"
	# Kitty
	".config/kitty/kitty.conf"
	".config/kitty/current-theme.conf"
	# Other
	".gitconfig"
	".p10k.zsh"
	".vimrc"
	".zshrc"
)

for dotfile in "${dotfiles[@]}"
do
	# Create a symlink targeting the dotfiles directory in the home directory
	symlink "$(pwd)/$dotfile" "$HOME/$dotfile"
done
