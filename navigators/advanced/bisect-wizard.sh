#!/bin/bash
source "$(dirname "$0")/../common/utils.sh"

if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    log_error "Not a git repository."
    exit 1
fi

NAVIGATOR_NAME="Bisect Wizard (Bug Hunter)"
COMMAND="git bisect [good] [bad]"
TIP="Automates a binary search to find exactly which commit introduced a bug. You mark one 'good' version and one 'bad' version, and Git does the rest."

display_navigator "$COMMAND" "$TIP"

log_info "Step 1: Mark the CURRENT version as 'bad'."
if confirm_action; then
    git bisect start
    git bisect bad
    
    log_info "Step 2: Find a commit hash where the bug DID NOT exist."
    git log --oneline -n 20
    read -p "Enter a 'GOOD' commit hash: " good_hash
    
    if [ -n "$good_hash" ]; then
        git bisect good "$good_hash"
        log_success "Bisect started! Git will now checkout versions for you to test."
        log_info "Instruction: Test the app. If it works, run 'git bisect good'. If it's broken, run 'git bisect bad'."
        log_info "To finish, run 'git bisect reset'."
    else
        git bisect reset
        log_warn "No hash entered. Bisect aborted."
    fi
fi
