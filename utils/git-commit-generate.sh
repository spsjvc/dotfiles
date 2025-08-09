#!/bin/bash

git_commit_generate() {
    local count=${1:-3}
    local prompt="Write a single-line git commit message based on changes in the currently staged files. Don't preface your response with any extra text, just output the commit message. Don't use more than 50 characters for the commit message. Use the same style that's already present in the git history. Give $count different options separated by a newline character."
    local options=$(claude -p "$prompt")
    local selected=$(echo "$options" | fzf --prompt="Commit message: " --height $((count + 2)))

    if [ -n "$selected" ]; then
        # see .gitconfig for the alias
        git c "$selected"
    fi
}
