#!/bin/bash

declare -a dotfiles=(
	".config/kitty/kitty.conf"
	".config/kitty/current-theme.conf"
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


