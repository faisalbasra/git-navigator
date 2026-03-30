#!/bin/bash
source "$(dirname "$0")/../common/utils.sh"

NAVIGATOR_NAME="Conditional Git Identity (Auto-Email)"
COMMAND="[includeIf \"gitdir:~/work/\"]\n  path = .gitconfig-work"
TIP="Automatically swaps your Git email and name based on the folder you are in. Never accidentally commit to a work repo with your personal email again!"

display_navigator "$COMMAND" "$TIP"

log_info "Current Global Identity:"
git config --global user.email
git config --global user.name
echo "-----------------------------------"

if confirm_action; then
    read -p "Enter the directory for your WORK projects (e.g., ~/work/): " work_dir
    read -p "Enter your WORK email: " work_email
    read -p "Enter your WORK name: " work_name
    
    if [ -n "$work_dir" ] && [ -n "$work_email" ]; then
        # Create the work-specific config
        work_config="$HOME/.gitconfig-work"
        cat > "$work_config" <<EOL
[user]
    email = $work_email
    name = $work_name
EOL
        log_success "Created work config at $work_config"
        
        # Add the includeIf to global config (if it doesn't already exist)
        if ! grep -q "gitdir:$work_dir" ~/.gitconfig; then
            cat >> ~/.gitconfig <<EOL

[includeIf "gitdir:$work_dir"]
    path = .gitconfig-work
EOL
            log_success "Added includeIf to your ~/.gitconfig for $work_dir"
        else
            log_warn "Identity rule already exists in ~/.gitconfig."
        fi
    else
        log_error "Missing information. Action cancelled."
    fi
fi
