#!/bin/bash
source "$(dirname "$0")/../common/utils.sh"

RECIPE_NAME="SSH & Identity Setup"
COMMAND="./setup_github_keys.sh."
TIP="Generates separate SSH keys for personal/work and configures ~/.ssh/config aliases."

display_recipe "$COMMAND" "$TIP"

if confirm_action; then
    # Call the original script from the project root
    bash "$(dirname "$0")/../../setup_github_keys.sh."
fi
