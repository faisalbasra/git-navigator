#!/bin/bash
source "$(dirname "$0")/../common/utils.sh"

NAVIGATOR_NAME="Emergency Recovery (Reflog)"
COMMAND="git reflog"
TIP="The Reflog records every time your branch head moves. Use this to find 'lost' commits after a bad rebase or accidental deletion."

display_navigator "$COMMAND" "$TIP"

log_info "Opening reflog. Look for the HEAD@{x} position before your accident."
git reflog -n 20
echo "-----------------------------------"
log_info "To recover a commit, use: git checkout -b recovery-branch HEAD@{x}"
