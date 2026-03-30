#!/bin/bash
source "$(dirname "$0")/../common/utils.sh"

if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    log_error "Not a git repository."
    exit 1
fi

RECIPE_NAME="Sync with Main (Rebase)"
COMMAND="git fetch origin main && git rebase origin/main"
TIP="Updates your branch with the latest changes from main. Rebasing keeps history clean and linear."

display_recipe "$COMMAND" "$TIP"

if confirm_action; then
    log_info "Fetching latest main..."
    git fetch origin main
    log_info "Rebasing onto origin/main..."
    git rebase origin/main
    
    if [ $? -eq 0 ]; then
        log_success "Branch is now synced with main!"
    else
        log_error "Rebase failed. You may have conflicts to resolve."
    fi
fi
