#!/bin/bash
source "$(dirname "$0")/../common/utils.sh"

if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    log_error "Not a git repository."
    exit 1
fi

NAVIGATOR_NAME="Update Remote URL"
COMMAND="git remote set-url [name] [new-url]"
TIP="Changes the URL of an existing remote. Use this if your repository moved or you changed the name."

display_navigator "$COMMAND" "$TIP"

remotes=($(git remote))
if [ ${#remotes[@]} -eq 0 ]; then
    log_warn "No remotes found to update."
    exit 0
fi

echo "Current Remotes:"
git remote -v
echo "-----------------------------------"

if confirm_action; then
    PS3="Select a Remote to Update (or 'q' to go back): "
    select r in "${remotes[@]}"; do
        if [ "$REPLY" == "q" ]; then exit 0; fi
        if [ -n "$r" ]; then
            read -p "Enter new URL for '$r': " new_url
            if [ -n "$new_url" ]; then
                git remote set-url "$r" "$new_url"
                log_success "Remote '$r' URL updated successfully!"
                git remote -v
                break
            else
                log_warn "No URL entered. Action cancelled."
                break
            fi
        else
            log_error "Invalid option $REPLY"
        fi
    done
fi
