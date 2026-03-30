#!/bin/bash
source "$(dirname "$0")/../common/utils.sh"

# Ensure we're in a git repo
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    log_error "Not a git repository."
    exit 1
fi

NAVIGATOR_NAME="Historical Identity Rewrite (Witness Protection)"
COMMAND="git filter-branch --env-filter '...' -- --branches --tags"
TIP="REWRITES ALL HISTORY. Every commit SHA will change. Only use this if you haven't shared your branch, or if you're prepared to force-push and coordinate with your team."

display_navigator "$COMMAND" "$TIP"

log_warn "This is a NUCLEAR OPTION. It will rewrite every commit in your history."
log_warn "If you have already pushed, your teammates will need to re-clone or rebase."

if confirm_action; then
    read -p "Enter the OLD email address to replace: " old_email
    read -p "Enter the CORRECT name: " correct_name
    read -p "Enter the CORRECT email address: " correct_email
    
    if [ -z "$old_email" ] || [ -z "$correct_name" ] || [ -z "$correct_email" ]; then
        log_error "All fields are required. Action cancelled."
        exit 1
    fi

    log_info "Starting the rewrite process. This may take a while for large repositories..."

    # The filter-branch script
    git filter-branch --force --env-filter "
    if [ \"\$GIT_COMMITTER_EMAIL\" = \"$old_email\" ]
    then
        export GIT_COMMITTER_NAME=\"$correct_name\"
        export GIT_COMMITTER_EMAIL=\"$correct_email\"
    fi
    if [ \"\$GIT_AUTHOR_EMAIL\" = \"$old_email\" ]
    then
        export GIT_AUTHOR_NAME=\"$correct_name\"
        export GIT_AUTHOR_EMAIL=\"$correct_email\"
    fi
    " --tag-name-filter cat -- --branches --tags

    if [ $? -eq 0 ]; then
        log_success "History successfully rewritten!"
        log_info "Next steps:"
        log_info "1. Verify your history with 'git log -n 10 --format=\"%ae | %an | %s\"'"
        log_info "2. If everything looks good, force-push: 'git push origin --force --all'"
        log_info "3. Tell your team to run: 'git fetch origin && git reset --hard origin/main'"
    else
        log_error "History rewrite failed. Check the output for errors."
    fi
fi
