#!/bin/bash
source "$(dirname "$0")/../common/utils.sh"

RECIPE_NAME="Multi-Task with Worktrees"
COMMAND="git worktree add ../[dir] [branch]"
TIP="Allows you to have multiple branches checked out simultaneously in different directories. Perfect for hotfixes while working on a feature."

display_recipe "$COMMAND" "$TIP"

if confirm_action; then
    read -p "Enter branch to work on: " branch
    read -p "Enter directory name for this work: " dir
    
    if [ -n "$branch" ] && [ -n "$dir" ]; then
        git worktree add "../$dir" "$branch"
        log_success "Worktree created at ../$dir on branch $branch."
    else
        log_warn "Missing information. Action cancelled."
    fi
fi
