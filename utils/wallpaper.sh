wallpaper() {
	# Ensure an image path is provided
	if [ -z "$1" ]; then
		echo "[wallpaper] usage: wallpaper <path_to_image>"
		return 1
	fi

	# Get the full path of the provided image
	IMAGE_PATH="$1"

	# Check if the file exists
	if [ ! -f "$IMAGE_PATH" ]; then
		echo "[wallpaper] error: file not found"
		return 1
	fi

	# Define the destination folder for all wallpapers
	DEST_DIR="$HOME/Sync/Wallpapers"
	echo "[wallpaper] $DEST_DIR"

	# Create the destination directory if it doesn't exist
	mkdir -p "$DEST_DIR"

	# Extract the filename
	FILE_NAME="$(basename "$IMAGE_PATH")"
	DEST_PATH="$DEST_DIR/$FILE_NAME"

	# Move the new wallpaper to the destination
	mv "$IMAGE_PATH" "$DEST_PATH"
	echo "[wallpaper]   $FILE_NAME moved"

	# Update .fehbg
	FEHBG_PATH="$HOME/.fehbg"
	echo -e "#!/bin/sh\nfeh --no-fehbg --bg-fill '$DEST_PATH'" > "$FEHBG_PATH"
	chmod +x "$FEHBG_PATH"
	echo "[wallpaper]   .fehbg updated"

	# Run .fehbg
	$HOME/.fehbg
	echo "[wallpaper]   .fehbg executed"
}

# Usage: wallpaper /path/to/image
