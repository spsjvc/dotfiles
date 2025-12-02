#!/bin/bash

# Set modifier key based on platform
if [ "$(uname -s)" = "Darwin" ]; then
    PLATFORM_MOD_KEY="cmd"
    PLATFORM_NAME="macOS"
else
    PLATFORM_MOD_KEY="ctrl"
    PLATFORM_NAME="Linux"
fi

TEMPLATE_PATH="$(pwd)/.config/Code/User/keybindings.template.json"
OUTPUT_PATH="$(pwd)/.config/Code/User/keybindings.json"

# Generate keybindings by replacing {{mod}} with the platform-specific modifier key
sed "s/{{mod}}/$PLATFORM_MOD_KEY/g" "$TEMPLATE_PATH" > "$OUTPUT_PATH"

if [ $? -eq 0 ]; then
    echo "🟢 with $PLATFORM_MOD_KEY as the modifier key on $PLATFORM_NAME"
else
    echo "🔴 failed"
    exit 1
fi
