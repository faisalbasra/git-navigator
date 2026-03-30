#!/bin/bash
source "$(dirname "$0")/../common/utils.sh"

if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    log_error "Not a git repository."
    exit 1
fi

NAVIGATOR_NAME="Surgical Staging (Hunks)"
COMMAND="git add -p"
TIP="Interactive staging allows you to review every change and decide which specific parts to include in your next commit. This keeps commits focused and clean."

display_navigator "$COMMAND" "$TIP"

log_info "Opening interactive staging. Use [y] to stage, [n] to skip, [s] to split, [q] to quit."

if confirm_action; then
    git add -p
    log_success "Staging complete! Review your staged files with 'git status'."
fi
