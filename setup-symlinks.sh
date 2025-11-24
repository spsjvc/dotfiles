#!/bin/bash

source ./utils/symlink.sh

# Detect platform
PLATFORM=$(uname -s)

# Cross-platform dotfiles
declare -a dotfiles_common=(
	# Aviator
	".config/av/config.yaml"
	# Visual Studio Code
	".config/Code/User/settings.json"
	".config/Code/User/keybindings.json"
	# Kitty
	".config/kitty/kitty.conf"
	".config/kitty/Catppuccin-Latte.conf"
	".config/kitty/Catppuccin-Mocha.conf"
	".config/kitty/Catppuccin-Mocha-Custom.conf"
	# Ghostty
	".config/ghostty/config"
	# Zellij
	".config/zellij/config.kdl"
	# Claude Code
	".claude/settings.json"
	".claude/statusline.sh"
	# Other
	".gitconfig"
	".vimrc"
	".zshrc"
)

# Linux-specific dotfiles
declare -a dotfiles_linux=(
	# Hyprland
	".config/hypr/hyprland.conf"
	# i3 and i3tidy
	".config/i3/config"
	".config/i3/$(hostname).conf"
	".config/i3tidy/config.json"
	# Picom
	".config/picom/picom.conf"
	# Rofi
	".config/rofi/config.rasi"
	# X11
	".xinitrc"
)

# macOS-specific dotfiles
declare -a dotfiles_macos=(
	# AeroSpace
	".config/aerospace/aerospace.toml"
)

# Build the list of dotfiles to symlink based on platform
declare -a dotfiles=("${dotfiles_common[@]}")

if [ "$PLATFORM" = "Darwin" ]; then
	dotfiles+=("${dotfiles_macos[@]}")
else
	dotfiles+=("${dotfiles_linux[@]}")
fi

for dotfile in "${dotfiles[@]}"
do
	# Create a symlink in the home directory targeting the dotfiles directory
	if symlink "$(pwd)/$dotfile" "$HOME/$dotfile"; then
		echo "🟢 $HOME/$dotfile"
	else
		echo "🔴 $HOME/$dotfile"
	fi
done

# On macOS, point Visual Studio Code settings to Linux paths
if [ "$PLATFORM" = "Darwin" ]; then
	symlink "$HOME/.config/Code/User/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
	symlink "$HOME/.config/Code/User/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"
fi
