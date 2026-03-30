#!/bin/bash
source "$(dirname "$0")/../common/utils.sh"

if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    log_error "Not a git repository."
    exit 1
fi

NAVIGATOR_NAME="Nuclear Reset (Clean Slate)"
COMMAND="git fetch origin && git reset --hard origin/$(git branch --show-current)"
TIP="Completely discards ALL local changes and makes your branch exactly match the server. WARNING: This cannot be undone!"

display_navigator "$COMMAND" "$TIP"

if confirm_action; then
    log_warn "This will DELETE all uncommitted work. Are you absolutely sure?"
    read -p "Type 'RESET' to confirm: " confirm
    if [ "$confirm" == "RESET" ]; then
        log_info "Fetching latest from origin..."
        git fetch origin
        current_branch=$(git branch --show-current)
        log_info "Resetting to origin/$current_branch..."
        git reset --hard "origin/$current_branch"
        log_success "Repository is now identical to the server!"
    else
        log_warn "Confirmation failed. Action cancelled."
    fi
fi
