#!/bin/bash

# Bookmark script which presents bookmarks via rofi and opens the selected URL
# Bookmark format: url|title|icon (title and icon are optional)

BOOKMARKS_FILE="${HOME}/.bookmarks"

# Check if bookmarks file exists, create a default one if not found
if [[ ! -f "$BOOKMARKS_FILE" ]]; then
    echo "Creating default bookmarks file: $BOOKMARKS_FILE"
    {
        echo "https://github.com/davatorium/rofi|Rofi"
        echo "https://wiki.archlinux.org|Arch Wiki|archlinux"
    } > "$BOOKMARKS_FILE"
fi

# Read bookmarks and format them for rofi with icons
# Uses rofi's native icon format: title\0icon\x1f<icon_name>
selected=$(while IFS='|' read -r url title icon; do
    if [[ -n "$title" ]]; then
        # Entry has a title
        if [[ -n "$icon" ]]; then
            # Use provided icon
            printf "%s\0icon\x1f%s\n" "$title" "$icon"
        else
            # Use fallback icon
            printf "%s\0icon\x1f%s\n" "$title" "web-browser"
        fi
    else
        # Entry has no title, display URL with fallback icon
        printf "%s\0icon\x1f%s\n" "$url" "web-browser"
    fi
done < "$BOOKMARKS_FILE" | rofi -dmenu -p "Bookmarks" -show-icons -i)

# If user selected something, find the corresponding URL and open it
if [[ -n "$selected" ]]; then
    # Clean the selected text (rofi returns just the title)
    selected_title="$selected"

    # Find the URL for the selected bookmark
    url=$(while IFS='|' read -r bookmark_url bookmark_title bookmark_icon; do
        if [[ -n "$bookmark_title" && "$bookmark_title" == "$selected_title" ]]; then
            # Match by title
            echo "$bookmark_url"
            break
        elif [[ -z "$bookmark_title" && "$bookmark_url" == "$selected" ]]; then
            # Match by URL (for entries without titles)
            echo "$bookmark_url"
            break
        fi
    done < "$BOOKMARKS_FILE")

    # Open the URL with the default application
    if [[ -n "$url" ]]; then
        xdg-open "$url"
    fi
fi
