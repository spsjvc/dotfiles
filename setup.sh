#!/bin/bash

echo "Setting up symlinks for dotfiles..."
./setup-symlinks.sh

echo "Setting up plugins for zsh..."
./setup-zsh-plugins.sh
