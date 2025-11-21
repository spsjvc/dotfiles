#!/bin/bash

symlink() {
	target=$1
	link=$2

	if [ -L "$link" ] ; then
		# Symlink exists, check if it points to the correct target
		current_target=$(readlink "$link")

		if [ "$current_target" = "$target" ]; then
			# Symlink points to the correct target already
			return 0
		else
			# Symlink points to wrong target, remove it and recreate
			rm "$link" && \
			# Create the symbolic link
			ln -s "$target" "$link" && \
			# Return the status of ln
			return $?
		fi
	else
		# Create the parent directory in case it doesn't exist
		mkdir -p $(dirname "$link") && \
		# Create the symbolic link
		ln -s "$target" "$link" && \
		# Return the status of ln
		return $?
	fi
}
