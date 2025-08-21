#!/bin/bash

get_git_info() {
    local git_info=""
    local git_branch=$(git branch --show-current 2>/dev/null)

    local git_diff_num_files_changed=$(git diff --name-only 2>/dev/null | wc -l)
    local git_diff_num_lines=$(git diff --numstat 2>/dev/null)
    local git_diff_num_lines_added=$(echo "$git_diff_num_lines" | awk '{add+=$1} END {print add+0}')
    local git_diff_num_lines_removed=$(echo "$git_diff_num_lines" | awk '{del+=$2} END {print del+0}')

    if [ -n "$git_branch" ]; then
        git_info+="\033[0;33m$git_branch\033[0m"

        if [ "$git_diff_num_files_changed" -gt 0 ]; then
            if [ "$git_diff_num_files_changed" -eq 1 ]; then
                git_info+=" \033[0;37m$git_diff_num_files_changed file changed\033[0m"
            else
                git_info+=" \033[0;37m$git_diff_num_files_changed files changed\033[0m"
            fi

            if [ "$git_diff_num_lines_added" -gt 0 ]; then
                git_info+=" \033[0;32m+$git_diff_num_lines_added\033[0m"
            fi

            if [ "$git_diff_num_lines_removed" -gt 0 ]; then
                git_info+=" \033[0;31m-$git_diff_num_lines_removed\033[0m"
            fi
        fi
    fi

    echo "$git_info"
}

printf "%b\n" "$(get_git_info)"
