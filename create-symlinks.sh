#!/bin/bash

declare -a dotfiles=(
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


