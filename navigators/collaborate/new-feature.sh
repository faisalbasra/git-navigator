#!/bin/bash
source "$(dirname "$0")/../common/utils.sh"

NAVIGATOR_NAME="Create New Feature Branch"
COMMAND="git checkout -b feature/[name]"
TIP="Creates a new branch using the standard 'feature/' prefix for better organization."

display_navigator "$COMMAND" "$TIP"

if confirm_action; then
    read -p "Enter feature name (e.g., login-fix): " name
    if [ -n "$name" ]; then
        git checkout -b "feature/$name"
        log_success "Switched to new branch: feature/$name"
    else
        log_warn "No name entered. Action cancelled."
    fi
fi
