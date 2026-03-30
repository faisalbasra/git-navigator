#!/bin/bash
source "$(dirname "$0")/../common/utils.sh"

if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    log_error "Not a git repository."
    exit 1
fi

NAVIGATOR_NAME="Repo Health Audit"
COMMAND="git count-objects -vH"
TIP="Checks your repository for bloat, large files, and deep history that might be slowing down the team. A healthy repository is a fast repository."

display_navigator "$COMMAND" "$TIP"

log_info "Analyzing objects and disk usage..."
git count-objects -vH
echo "-----------------------------------"

log_info "Finding Top 10 LARGEST files in current history:"
git ls-tree -r -t -l --full-name HEAD | sort -rn -k 4 | head -n 10 | awk '{print $4/1024 " KB\t" $5}'

echo "-----------------------------------"
log_info "Checking for deep history bloat..."
git rev-list --count --all | xargs echo "Total Commits in History: "
