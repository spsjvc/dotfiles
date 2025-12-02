#!/bin/bash

echo "Setting up keybindings for VS Code..."
./setup-vscode-keybindings.sh

echo "Setting up plugins for Zsh..."
./setup-zsh-plugins.sh

echo "Setting up symlinks..."
./setup-symlinks.sh
