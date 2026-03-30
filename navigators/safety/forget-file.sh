#!/bin/bash
source "$(dirname "$0")/../common/utils.sh"

if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    log_error "Not a git repository."
    exit 1
fi

NAVIGATOR_NAME="Forget Tracked File"
COMMAND="git rm --cached [filename]"
TIP="Untracks a file from Git without deleting it from your computer. Ideal for removing secrets or build files that were accidentally added."

display_navigator "$COMMAND" "$TIP"

if confirm_action; then
    read -p "Enter filename to untrack (e.g., .env): " filename
    if [ -f "$filename" ]; then
        git rm --cached "$filename"
        log_success "Git is no longer tracking '$filename'. Remember to add it to your .gitignore!"
    else
        log_error "File '$filename' not found. Check the path and try again."
    fi
fi
