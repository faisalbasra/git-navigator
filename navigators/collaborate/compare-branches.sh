#!/bin/bash
source "$(dirname "$0")/../common/utils.sh"

if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    log_error "Not a git repository."
    exit 1
fi

NAVIGATOR_NAME="Compare Branches (Pre-PR)"
COMMAND="git diff main...[feature-branch]"
TIP="Shows exactly what has changed between your feature branch and the main branch since they diverged. Ideal for a final self-review before opening a Pull Request."

display_navigator "$COMMAND" "$TIP"

current_branch=$(git branch --show-current)
log_info "Comparing current branch [$current_branch] against 'main'..."

if confirm_action; then
    # Try common base branches
    base="main"
    if ! git rev-parse --verify "$base" > /dev/null 2>&1; then
        base="master"
    fi
    
    log_info "Running: git diff $base...$current_branch"
    git diff "$base...$current_branch" --stat
    echo "-----------------------------------"
    read -p "Would you like to see the full code diff? (y/n): " full_diff
    if [[ $full_diff =~ ^[Yy]$ ]]; then
        git diff "$base...$current_branch"
    fi
fi
