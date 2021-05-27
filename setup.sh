#!/bin/bash

cp .gitconfig ~/.gitconfig
cp .vimrc ~/.vimrc

if [ "$(uname)" == "Darwin" ]; then
    cp ./vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
    cp ./vscode/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    cp ./vscode/settings.json $HOME/.config/Code/User/settings.json
    cp ./vscode/keybindings.json $HOME/.config/Code/User/keybindings.json
fi
