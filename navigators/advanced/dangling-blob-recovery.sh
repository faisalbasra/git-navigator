#!/bin/bash
source "$(dirname "$0")/../common/utils.sh"

if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    log_error "Not a git repository."
    exit 1
fi

NAVIGATOR_NAME="Dangling Blob Recovery (God Mode)"
COMMAND="git fsck --lost-found"
TIP="Recovers code that was 'git add'-ed but never committed. If you ran 'git reset --hard' and lost your staged changes, this tool is your last hope. It finds 'dangling' objects in the Git database."

display_navigator "$COMMAND" "$TIP"

log_info "Scanning Git database for lost-and-found objects..."
if confirm_action; then
    git fsck --lost-found
    
    found_dir=".git/lost-found/other"
    if [ -d "$found_dir" ] && [ "$(ls -A "$found_dir")" ]; then
        log_success "Found lost blobs! They are stored in: $found_dir"
        log_info "Previewing the last 5 recovered blobs:"
        ls -t "$found_dir" | head -n 5 | xargs -I {} head -n 10 "$found_dir/{}"
        echo "-----------------------------------"
        log_info "To recover a file, run: cat $found_dir/[hash] > recovered_file.txt"
    else
        log_warn "No dangling blobs found. Your database is clean (or the objects were garbage collected)."
    fi
fi
