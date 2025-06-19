#!/bin/bash

# Bookmark script which presents bookmarks via rofi and opens the selected URL
# Bookmark format: url|title|icon (title and icon are optional)

BOOKMARKS_FILE="${HOME}/.bookmarks"

# Create default bookmarks file
create_default_bookmarks_file() {
    echo "Creating default bookmarks file: $BOOKMARKS_FILE"
    {
        echo "https://github.com/davatorium/rofi|Rofi"
        echo "https://wiki.archlinux.org|Arch Wiki|archlinux"
    } > "$BOOKMARKS_FILE"
}

# Generate rofi menu from bookmarks file
generate_rofi_menu_items() {
    while IFS='|' read -r url title icon; do
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
    done < "$BOOKMARKS_FILE"
}

# Find bookmark URL by title or direct URL match
find_bookmark_by_title_or_url() {
    local selected_title="$1"

    while IFS='|' read -r bookmark_url bookmark_title bookmark_icon; do
        if [[ -n "$bookmark_title" && "$bookmark_title" == "$selected_title" ]]; then
            # Match by title
            echo "$bookmark_url"
            return
        elif [[ -z "$bookmark_title" && "$bookmark_url" == "$selected_title" ]]; then
            # Match by URL (for entries without titles)
            echo "$bookmark_url"
            return
        fi
    done < "$BOOKMARKS_FILE"
}

# Handle input that's not in bookmarks (URL or search query)
handle_bookmark_doesnt_exist() {
    local input="$1"

    # Check if the input looks like a URL
    if [[ "$input" =~ ^https?:// ]] || [[ "$input" =~ ^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}(/.*)?$ ]]; then
        # It looks like a URL, use it directly
        local url="$input"
        # Add https:// prefix if no protocol specified
        if [[ ! "$url" =~ ^https?: ]]; then
            url="https://$url"
        fi
        echo "$url"
    else
        # Not a URL, treat as search query for DuckDuckGo
        echo "https://duckduckgo.com/?q=$(printf '%s' "$input" | sed 's/ /+/g')"
    fi
}

main() {
    if [[ ! -f "$BOOKMARKS_FILE" ]]; then
        create_default_bookmarks_file
    fi

    selected=$(generate_rofi_menu_items | rofi -dmenu -p "Bookmarks" -show-icons -i)

    # If user selected something, find the corresponding URL and open it
    if [[ -n "$selected" ]]; then
        # Clean the selected text (rofi returns just the title)
        selected_item="$selected"

        # Find the URL for the selected bookmark
        url=$(find_bookmark_by_title_or_url "$selected_item")

        # If no URL found in bookmarks, handle as URL or search query
        if [[ -z "$url" ]]; then
            url=$(handle_bookmark_doesnt_exist "$selected")
        fi

        # Open the URL with the default application
        if [[ -n "$url" ]]; then
            xdg-open "$url"
        fi
    fi
}

main
