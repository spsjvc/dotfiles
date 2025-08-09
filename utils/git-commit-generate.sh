#!/bin/bash

git_commit_generate() {
    local count=${1:-3}
    local prompt="Write a single-line git commit message based on changes in the currently staged files. Don't preface your response with any extra text, just output the commit message. Don't use more than 50 characters for the commit message. Use the same style that's already present in the git history. Give $count different options separated by a newline character."

    local custom="> Write a custom commit message"
    local options=$(claude -p "$prompt")
    local options_with_custom=$(printf "%s\n%s" "$options" "$custom")

    local selected=$(echo "$options_with_custom" | fzf --prompt="Commit message: " --height $((count + 3)))
    local commit_message=""

    if [ "$selected" = "$custom" ]; then
        read -e -p "Commit message: " commit_message
    elif [ -n "$selected" ]; then
        commit_message="$selected"
    fi

    if [ -n "$commit_message" ]; then
        # see .gitconfig for the alias
        git c "$commit_message"
    fi
}
