#!/bin/bash
source "$(dirname "$0")/../common/utils.sh"

NAVIGATOR_NAME="Cleanup Merged Branches"
COMMAND="git remote prune origin && git branch --merged | grep -v \"\*\" | xargs -n 1 git branch -d"
TIP="Safely deletes local branches that have already been merged into your current branch."

display_navigator "$COMMAND" "$TIP"

if confirm_action; then
    log_info "Pruning remote-tracking branches..."
    git remote prune origin
    log_info "Identifying merged branches..."
    # Get merged branches, excluding current (*) and main/master
    merged_branches=$(git branch --merged | grep -v '^\*' | grep -vE '^(  master|  main)$')
    
    if [ -z "$merged_branches" ]; then
        log_info "No merged branches to clean up."
    else
        echo "$merged_branches" | xargs -n 1 git branch -d
        log_success "Cleanup complete!"
    fi
fi
