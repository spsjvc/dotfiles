#!/bin/bash

symlink() {
	target=$1
	link=$2

	echo "$link -> $target"

	if [ -L $link ] ; then
		echo "  symlink already exists"
	else
		# Create the parent directory in case it doesn't exist
		mkdir -p $(dirname "$link") && \
		# Create the symbolic link
		ln -s $target $link && \
		echo "  symlink created"
	fi
}
