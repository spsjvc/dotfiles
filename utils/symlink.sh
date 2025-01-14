#!/bin/bash

symlink() {
	target=$1
	link=$2

	echo "$link -> $target"

	if [ -L $link ] ; then
		echo "  symlink already exists"
	else
		ln -s $target $link
		echo "  symlink created"
	fi
}
