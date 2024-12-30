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
	".vimrc"
	".zshrc"
)

for dotfile in "${dotfiles[@]}"
do
	src="$(pwd)/$dotfile"
	link="$HOME/$dotfile"

	echo "$link -> $src"

	if [ -L $link ] ; then
		echo "  symlink already exists"
	else
		ln -s $src $link
		echo "  symlink created"
	fi
done
