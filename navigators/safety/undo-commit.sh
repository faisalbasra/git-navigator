#!/bin/bash
source "$(dirname "$0")/../common/utils.sh"

# Ensure we're in a git repo
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    log_error "Not a git repository."
    exit 1
fi

NAVIGATOR_NAME="Undo Last Commit (Keep Changes)"
COMMAND="git reset --soft HEAD~1"
TIP="Un-commits your last change but keeps all your files modified in the staging area."

display_navigator "$COMMAND" "$TIP"

if confirm_action; then
    git reset --soft HEAD~1
    log_success "Last commit undone. Files are staged and ready for a new commit."
fi
