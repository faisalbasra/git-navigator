#!/bin/bash
# Color codes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

confirm_action() {
    read -p "Run this command? (y/n): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        log_warn "Action cancelled."
        return 1
    fi
    return 0
}

display_recipe() {
    local cmd="$1"
    local tip="$2"
    echo -e "${YELLOW}Command:${NC} $cmd"
    echo -e "${BLUE}Pro-Tip:${NC} $tip"
    echo "-----------------------------------"
}
