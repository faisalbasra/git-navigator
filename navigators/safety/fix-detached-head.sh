#!/bin/bash
source "$(dirname "$0")/../common/utils.sh"

if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    log_error "Not a git repository."
    exit 1
fi

NAVIGATOR_NAME="Fix Detached HEAD (Safe Re-attach)"
COMMAND="git checkout -b [temp-branch]"
TIP="A 'Detached HEAD' happens when you checkout a specific commit instead of a branch. If you made commits in this state, they will be LOST unless you attach them back to a branch."

display_navigator "$COMMAND" "$TIP"

# Check if we are in detached HEAD state
if git branch --show-current > /dev/null 2>&1 && [ -n "$(git branch --show-current)" ]; then
    log_info "You are NOT in a detached HEAD state. You are on branch: $(git branch --show-current)"
    exit 0
fi

log_warn "You are in a DETACHED HEAD state! Any new commits are 'floating'."

if confirm_action; then
    read -p "Enter a name for the branch to save your work to: " branch_name
    if [ -n "$branch_name" ]; then
        git checkout -b "$branch_name"
        log_success "Work saved! You are now on a real branch: $branch_name"
    else
        log_warn "No branch name entered. Action cancelled."
    fi
fi
