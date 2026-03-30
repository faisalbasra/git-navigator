#!/bin/bash
source "$(dirname "$0")/../common/utils.sh"

if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    log_error "Not a git repository."
    exit 1
fi

NAVIGATOR_NAME="Clean Untracked Junk"
COMMAND="git clean -fd"
TIP="Deletes all untracked files and folders from your workspace. Great for cleaning up after a massive build or accidental unzip."

display_navigator "$COMMAND" "$TIP"

log_info "Files to be DELETED:"
git clean -nd

if confirm_action; then
    git clean -fd
    log_success "Workspace is now clean!"
fi
