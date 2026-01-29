#!/bin/bash

install_zsh_plugin() {
	plugin_repo=$1
	plugin_name=$2
	plugin_directory="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/$plugin_name"

	if [ ! -d "$plugin_directory" ]; then
		git clone "$plugin_repo" "$plugin_directory"
	fi

	echo "🟢 $plugin_name"
}

# Install as plugins for Oh My Zsh
install_zsh_plugin "https://github.com/Aloxaf/fzf-tab" "fzf-tab"
install_zsh_plugin "https://github.com/zsh-users/zsh-autosuggestions" "zsh-autosuggestions"
install_zsh_plugin "https://github.com/zsh-users/zsh-syntax-highlighting.git" "zsh-syntax-highlighting"
