#!/bin/bash

source ./utils/symlink.sh

declare -a dotfiles=(
	# Aviator
	".config/av/config.yaml"
	# Visual Studio Code
	".config/Code/User/settings.json"
	".config/Code/User/keybindings.json"
    # Hyprland
    ".config/hypr/hyprland.conf"
	# i3 and i3tidy
	".config/i3/config"
	".config/i3/$(hostname).conf"
	".config/i3tidy/config.json"
	# Kitty
	".config/kitty/kitty.conf"
	".config/kitty/Catppuccin-Latte.conf"
	".config/kitty/Catppuccin-Mocha.conf"
	".config/kitty/Catppuccin-Mocha-Custom.conf"
	# Ghostty
	".config/ghostty/config"
	# Picom
	".config/picom/picom.conf"
	# Rofi
	".config/rofi/config.rasi"
	# Zellij
	".config/zellij/config.kdl"
	# Claude Code
	".claude/settings.json"
	".claude/statusline.sh"
	# Other
	".gitconfig"
	".p10k.zsh"
	".vimrc"
	".zshrc"
)

for dotfile in "${dotfiles[@]}"
do
	# Create a symlink targeting the dotfiles directory in the home directory
	symlink "$(pwd)/$dotfile" "$HOME/$dotfile"
done

# Point Cursor settings to Visual Studio Code settings
symlink "$HOME/.config/Code/User/settings.json" "$HOME/.config/Cursor/User/settings.json"
symlink "$HOME/.config/Code/User/keybindings.json" "$HOME/.config/Cursor/User/keybindings.json"
