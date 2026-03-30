#!/bin/bash
source "$(dirname "$0")/../common/utils.sh"

if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    log_error "Not a git repository."
    exit 1
fi

NAVIGATOR_NAME="Remove Remote Connection"
COMMAND="git remote remove [name]"
TIP="Disconnects your local repository from a remote server. This does NOT delete code on the server."

display_navigator "$COMMAND" "$TIP"

remotes=($(git remote))
if [ ${#remotes[@]} -eq 0 ]; then
    log_warn "No remotes found to remove."
    exit 0
fi

echo "Current Remotes:"
git remote -v
echo "-----------------------------------"

if confirm_action; then
    PS3="Select a Remote to Remove (or 'q' to go back): "
    select r in "${remotes[@]}"; do
        if [ "$REPLY" == "q" ]; then exit 0; fi
        if [ -n "$r" ]; then
            git remote remove "$r"
            log_success "Remote '$r' removed successfully!"
            break
        else
            log_error "Invalid option $REPLY"
        fi
    done
fi
