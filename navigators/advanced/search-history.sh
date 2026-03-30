#!/bin/bash
source "$(dirname "$0")/../common/utils.sh"

if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    log_error "Not a git repository."
    exit 1
fi

NAVIGATOR_NAME="Search Code History"
COMMAND="git log -S \"[string]\""
TIP="The 'Pickaxe' search. Finds the exact commits where a specific string (like a function name or variable) was added or deleted in the entire history of the project."

display_navigator "$COMMAND" "$TIP"

if confirm_action; then
    read -p "Enter the text to search for: " search_term
    if [ -n "$search_term" ]; then
        log_info "Searching history for '$search_term'..."
        git log -S "$search_term" --oneline --patch
    else
        log_warn "No search term entered. Action cancelled."
    fi
fi
