#!/bin/bash
source "$(dirname "$0")/../common/utils.sh"

# Ensure we're in a git repo
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    log_error "Not a git repository."
    exit 1
fi

RECIPE_NAME="Save Work to Stash"
COMMAND="git stash save \"[description]\""
TIP="Saves your uncommitted changes to a temporary storage, making your worktree clean."

display_recipe "$COMMAND" "$TIP"

if confirm_action; then
    read -p "Enter a description for the stash: " desc
    if [ -n "$desc" ]; then
        git stash save "$desc"
        log_success "Work saved to stash with description: $desc"
    else
        git stash
        log_success "Work saved to stash."
    fi
fi
