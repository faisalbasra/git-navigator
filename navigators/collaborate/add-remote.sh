#!/bin/bash
source "$(dirname "$0")/../common/utils.sh"

if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    log_error "Not a git repository."
    exit 1
fi

NAVIGATOR_NAME="Add New Remote"
COMMAND="git remote add [name] [url]"
TIP="Connects your local repository to a new remote server (like GitHub or GitLab)."

display_navigator "$COMMAND" "$TIP"

if confirm_action; then
    read -p "Enter remote name (default: origin): " name
    name=${name:-origin}
    read -p "Enter remote URL: " url
    
    if [ -n "$url" ]; then
        git remote add "$name" "$url"
        if [ $? -eq 0 ]; then
            log_success "Remote '$name' added successfully!"
            git remote -v
        else
            log_error "Failed to add remote. Check if the name already exists."
        fi
    else
        log_warn "No URL entered. Action cancelled."
    fi
fi
