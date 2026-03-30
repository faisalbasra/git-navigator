#!/bin/bash
source "$(dirname "$0")/../common/utils.sh"

if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    log_error "Not a git repository."
    exit 1
fi

NAVIGATOR_NAME="Surgical Cherry-Pick"
COMMAND="git cherry-pick [commit-hash]"
TIP="Allows you to pick a single commit from another branch and apply it to your current branch. Perfect for porting a bug fix without merging all changes."

display_navigator "$COMMAND" "$TIP"

log_info "Recent commits in this repo:"
git log --oneline -n 10
echo "-----------------------------------"

if confirm_action; then
    read -p "Enter the commit hash to pick: " hash
    if [ -n "$hash" ]; then
        git cherry-pick "$hash"
        if [ $? -eq 0 ]; then
            log_success "Commit $hash successfully picked!"
        else
            log_error "Cherry-pick failed. You may have conflicts to resolve."
        fi
    else
        log_warn "No hash entered. Action cancelled."
    fi
fi
