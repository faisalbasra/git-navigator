# Spec: Git Navigator CLI

## Overview
The Git Navigator is an interactive Bash-based CLI tool designed to help engineers of all levels navigate Git workflows safely and effectively. It uses a "Recipe" model where commands are explained before execution.

## Architecture
The project follows a modular, file-system-based architecture for recipe discovery.

### Directory Structure
```text
git-recipes/
├── recipe              # Main entry point (the "Navigator" script)
├── recipes/            # The library of Git knowledge
│   ├── safety/         # Local fixes, SSH setup, undoing mistakes
│   ├── collaborate/    # PR preparation, rebasing, syncing, branch management
│   └── advanced/       # Reflog, bisect, worktrees, repository auditing
```

## Functional Requirements

### 1. Dynamic Discovery
- The `recipe` script must dynamically list directories in `recipes/` as categories.
- The `recipe` script must dynamically list `.sh` files in a chosen category as recipes.
- Adding a new recipe is as simple as adding a `.sh` file to the appropriate folder.

### 2. Interaction Model (The "Wizard")
- **Level 1 Menu:** Select a Workflow Phase (Safety, Collaborate, Advanced).
- **Level 2 Menu:** Select a specific Recipe.
- **Level 3 (Execution):** 
    1. Display the Git command(s) to be run.
    2. Provide a 1-sentence "Pro-Tip" explanation.
    3. Prompt the user for confirmation (y/n) before running.

### 3. Recipe Categories
- **Safety & Hygiene:**
    - `ssh-setup.sh`: Automated SSH key generation and config (re-using existing logic).
    - `fix-last-message.sh`: `git commit --amend` for typo fixes.
    - `undo-commit.sh`: `git reset --soft HEAD~1` to un-commit without losing work.
    - `save-to-stash.sh`: `git stash` with a descriptive message.
- **Team Collaboration:**
    - `sync-main.sh`: Safely pulling and rebasing from the main branch.
    - `prepare-pr.sh`: Interactive squash of recent commits.
    - `new-feature-branch.sh`: Creating a branch with standard naming conventions.
    - `cleanup-branches.sh`: Deleting local branches that have been merged upstream.
- **Deep Dive & Recovery:**
    - `emergency-recovery.sh`: Using `git reflog` to find a "lost" commit.
    - `bug-hunt-bisect.sh`: Starting a `git bisect` session.
    - `setup-worktree.sh`: Adding a git worktree for multi-tasking.
    - `repo-audit.sh`: Checking for large files or deep history bloat.

## Implementation Plan (Phase 1)
1. Create the base directory structure.
2. Implement the `recipe` entry point with the `select` menu logic.
3. Migrate the existing `setup_github_keys.sh.` into `recipes/safety/ssh-setup.sh`.
4. Implement the "Core 4" for the "Safety" category as a proof of concept.

## Non-Functional Requirements
- **Zero Dependencies:** Must run on standard Bash (macOS/Linux/WSL).
- **Idempotency:** Scripts should check state before acting (e.g., don't setup SSH if it already exists).
- **Educational:** The primary goal is teaching the "Why" behind the "How".
