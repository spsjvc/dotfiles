#!/bin/bash

source ./utils/symlink.sh

declare -a dotfiles=(
	# Visual Studio Code
	".config/Code/User/settings.json"
	".config/Code/User/keybindings.json"
	# i3 and i3wsr
	".config/i3/config"
	".config/i3/$(hostname).conf"
	".config/i3wsr/config.toml"
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
