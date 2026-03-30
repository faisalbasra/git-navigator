#!/bin/bash
source "$(dirname "$0")/../common/utils.sh"

# Ensure we're in a git repo
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    log_error "Not a git repository."
    exit 1
fi

RECIPE_NAME="Fix Typo in Last Commit"
COMMAND="git commit --amend -m \"[new message]\""
TIP="Replaces the last commit with a new message. DO NOT use if you have already pushed!"

display_recipe "$COMMAND" "$TIP"

if confirm_action; then
    # Show current last commit message for context
    current_msg=$(git log -1 --pretty=%B)
    log_info "Current message: $current_msg"
    
    read -p "Enter new commit message: " msg
    if [ -n "$msg" ]; then
        git commit --amend -m "$msg"
        log_success "Commit message updated!"
    else
        log_warn "No message entered. Action cancelled."
    fi
fi
