#!/bin/bash

get_git_info() {
    local git_info=""
    local git_branch=$(git branch --show-current 2>/dev/null)
    local git_diff_num=$(git diff --numstat 2>/dev/null)
    local git_diff_num_added=$(echo "$git_diff_num" | awk '{add+=$1} END {print add+0}')
    local git_diff_num_removed=$(echo "$git_diff_num" | awk '{del+=$2} END {print del+0}')

    if [ -n "$git_branch" ]; then
        if [ "$git_diff_num_added" -gt 0 ] || [ "$git_diff_num_removed" -gt 0 ]; then
            git_info="$git_branch \033[32m+$git_diff_num_added\033[0m \033[31m-$git_diff_num_removed\033[0m"
        else
            git_info="$git_branch"
        fi
    fi

    echo "$git_info"
}

printf "%b\n" "$(get_git_info)"
