#!/bin/bash
source "$(dirname "$0")/../common/utils.sh"

if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    log_error "Not a git repository."
    exit 1
fi

NAVIGATOR_NAME="Auto-Squash (Clean PR History)"
COMMAND="git rebase -i [base-branch]"
TIP="Interactive rebase allows you to 'squash' multiple small or 'oops' commits into one clean, professional commit before your team reviews your Pull Request."

display_navigator "$COMMAND" "$TIP"

# Attempt to find the base branch
base="main"
if ! git rev-parse --verify "$base" > /dev/null 2>&1; then
    base="master"
fi

log_info "Opening interactive rebase against '$base'..."
log_info "Instruction: Change 'pick' to 'squash' (or 's') for commits you want to combine."

if confirm_action; then
    # Merge-base finds where current branch split from the base
    split_point=$(git merge-base "$base" HEAD)
    git rebase -i "$split_point"
    if [ $? -eq 0 ]; then
        log_success "Rebase complete! Your history is now clean and PR-ready."
    else
        log_error "Rebase aborted or failed. If you have conflicts, Git will guide you."
    fi
fi
