#!/bin/bash

declare -a dotfiles=(
	# Visual Studio Code
	".config/Code/User/settings.json"
	".config/Code/User/keybindings.json"
	# Kitty
	".config/kitty/kitty.conf"
	".config/kitty/current-theme.conf"
	# Other
	".gitconfig"
	".zshrc"
)

for dotfile in "${dotfiles[@]}"
do
	src="$(pwd)/$dotfile"
	link="$HOME/$dotfile"

	if [ -L $link ] ; then
		echo "$link -> $src symlink already exists"
	else
		ln -s $src $link
		echo "$link -> $src symlink created"
	fi
done


