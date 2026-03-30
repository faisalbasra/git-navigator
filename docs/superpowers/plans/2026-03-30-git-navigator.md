# Git Navigator CLI Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build an interactive, modular Bash CLI for guided Git workflows.

**Architecture:** A lightweight "Wizard" that dynamically discovers and executes categorized shell scripts ("Recipes") with a "See-it-then-do-it" confirmation loop.

**Tech Stack:** Bash (macOS/Linux compatible).

---

### Task 1: Project Scaffolding & Shared Utilities

**Files:**
- Create: `recipes/common/utils.sh`
- Create: `recipes/safety/.gitkeep`
- Create: `recipes/collaborate/.gitkeep`
- Create: `recipes/advanced/.gitkeep`

- [ ] **Step 1: Create directory structure**
Run: `mkdir -p recipes/common recipes/safety recipes/collaborate recipes/advanced`

- [ ] **Step 2: Implement shared utilities**
Write the following to `recipes/common/utils.sh`:
```bash
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
```

- [ ] **Step 3: Commit scaffolding**
Run: `git add recipes/ && git commit -m "chore: scaffold recipe directories and common utils"`

---

### Task 2: Core Navigator Script (Entry Point)

**Files:**
- Create: `recipe` (root)

- [ ] **Step 1: Implement basic menu logic**
Write the following to `recipe`:
```bash
#!/bin/bash
source "$(dirname "$0")/recipes/common/utils.sh"

main_menu() {
    echo "--- Git Navigator ---"
    PS3="Select a Workflow Phase: "
    options=("Safety & Hygiene" "Team Collaboration" "Deep Dive & Recovery" "Exit")
    select opt in "${options[@]}"; do
        case $opt in
            "Safety & Hygiene") sub_menu "safety"; break ;;
            "Team Collaboration") sub_menu "collaborate"; break ;;
            "Deep Dive & Recovery") sub_menu "advanced"; break ;;
            "Exit") exit 0 ;;
            *) log_error "Invalid option $REPLY" ;;
        esac
    done
}

sub_menu() {
    local category=$1
    local dir="$(dirname "$0")/recipes/$category"
    
    if [ ! -d "$dir" ] || [ -z "$(ls -A "$dir"/*.sh 2>/dev/null)" ]; then
        log_warn "No recipes found in $category yet."
        main_menu
        return
    fi

    echo "--- $category Recipes ---"
    # Find all .sh files, remove path and extension
    recipes=($(ls "$dir"/*.sh | xargs -n 1 basename | sed 's/\.sh//'))
    
    PS3="Choose a Recipe (or 'q' to go back): "
    select r in "${recipes[@]}"; do
        if [ "$REPLY" == "q" ]; then main_menu; break; fi
        if [ -n "$r" ]; then
            bash "$dir/$r.sh"
            break
        else
            log_error "Invalid option $REPLY"
        fi
    done
}

main_menu
```

- [ ] **Step 2: Make executable and test**
Run: `chmod +x recipe && ./recipe` (Verify "No recipes found" warning works)

- [ ] **Step 3: Commit**
Run: `git add recipe && git commit -m "feat: implement main navigator script with dynamic discovery"`

---

### Task 3: Migrate SSH Setup Recipe

**Files:**
- Create: `recipes/safety/ssh-setup.sh`
- Modify: `setup_github_keys.sh.` (Review/Cleanup)

- [ ] **Step 1: Refactor SSH setup for the Navigator**
Write to `recipes/safety/ssh-setup.sh` (integrating with `utils.sh` pattern):
```bash
#!/bin/bash
source "$(dirname "$0")/../common/utils.sh"

RECIPE_NAME="SSH & Identity Setup"
COMMAND="./setup_github_keys.sh."
TIP="Generates separate SSH keys for personal/work and configures ~/.ssh/config aliases."

display_recipe "$COMMAND" "$TIP"

if confirm_action; then
    # For now, we call the existing script to reuse verified logic
    ./setup_github_keys.sh.
fi
```

- [ ] **Step 2: Verify migration**
Run: `./recipe` -> Safety -> SSH Setup (Verify it triggers)

- [ ] **Step 3: Commit**
Run: `git add recipes/safety/ssh-setup.sh && git commit -m "feat: migrate SSH setup to safety category"`

---

### Task 4: Implement "Fix Typo" Recipe

**Files:**
- Create: `recipes/safety/fix-last-message.sh`

- [ ] **Step 1: Implement Recipe**
Write to `recipes/safety/fix-last-message.sh`:
```bash
#!/bin/bash
source "$(dirname "$0")/../common/utils.sh"

if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    log_error "Not a git repository."
    exit 1
fi

RECIPE_NAME="Fix Typo in Last Commit"
COMMAND="git commit --amend -m \"[new message]\""
TIP="Replaces the last commit with a new message. DO NOT use if you have already pushed!"

display_recipe "$COMMAND" "$TIP"

if confirm_action; then
    read -p "Enter new commit message: " msg
    git commit --amend -m "$msg"
    log_success "Commit message updated!"
fi
```

- [ ] **Step 2: Verify**
Run: `git init test-repo && cd test-repo && touch a && git add a && git commit -m 'typo' && ../recipe`

- [ ] **Step 3: Commit**
Run: `git add recipes/safety/fix-last-message.sh && git commit -m "feat: add fix-last-message recipe"`

---

### Task 5: Implement "Undo Commit" Recipe

**Files:**
- Create: `recipes/safety/undo-commit.sh`

- [ ] **Step 1: Implement Recipe**
Write to `recipes/safety/undo-commit.sh`:
```bash
#!/bin/bash
source "$(dirname "$0")/../common/utils.sh"

RECIPE_NAME="Undo Last Commit (Keep Changes)"
COMMAND="git reset --soft HEAD~1"
TIP="Un-commits your last change but keeps all your files modified in the staging area."

display_recipe "$COMMAND" "$TIP"

if confirm_action; then
    git reset --soft HEAD~1
    log_success "Last commit undone. Files are staged and ready for a new commit."
fi
```

- [ ] **Step 2: Commit**
Run: `git add recipes/safety/undo-commit.sh && git commit -m "feat: add undo-commit recipe"`

---

### Task 6: Documentation & Cleanup

**Files:**
- Modify: `README.md`
- Delete: `setup_github_keys.sh.` (Optional, or keep as standalone)

- [ ] **Step 1: Update README**
Add instructions for running `./recipe`.

- [ ] **Step 2: Final verification run**
Run all "Safety" recipes in a test repository.

- [ ] **Step 3: Final Commit**
Run: `git add . && git commit -m "docs: update README and finalize navigator v1"`
