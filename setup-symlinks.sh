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
	# Neovim
	".config/nvim/init.lua"
	# Kitty
	".config/kitty/kitty.conf"
	# Ghostty
	".config/ghostty/config"
	# Claude Code
	".claude/settings.json"
	".claude/statusline.sh"
	# Starship
	".config/starship.toml"
	# Other
	".gitconfig"
	".tmux.conf"
	".vimrc"
	".zshrc"
)

# Linux-specific dotfiles
declare -a dotfiles_linux=(
	# Hyprland
	".config/hypr/hyprland.conf"
	# i3, i3tidy, i3status
	".config/i3/config"
	".config/i3/config.d/autostart.conf"
	".config/i3/config.d/keybindings.conf"
	".config/i3tidy/config.json"
	".config/i3status/config"
	# Picom
	".config/picom/picom.conf"
	# Rofi
	".config/rofi/config.rasi"
	# Waybar
	".config/waybar/config.jsonc"
	".config/waybar/style.css"
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
	symlink_with_status "$(pwd)/$dotfile" "$HOME/$dotfile"
done

# Point ~/Developer to ~/Code so both work
symlink_with_status "$HOME/Code" "$HOME/Developer"

# On macOS, point Visual Studio Code settings to Linux paths
if [ "$PLATFORM" = "Darwin" ]; then
	symlink_with_status "$HOME/.config/Code/User/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
	symlink_with_status "$HOME/.config/Code/User/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"
fi
