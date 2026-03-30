# 🧭 Git Navigator

**The "See-it-then-do-it" Git Companion.**

Git Navigator is an interactive CLI tool designed to help developers navigate Git workflows safely and effectively. Instead of memorizing complex flags, you use a guided "Navigator" model where every command is explained before you run it.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Bash](https://img.shields.io/badge/Shell-Bash-4EAA25?logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)

---

## 🚀 Why Git Navigator?

- **Educational:** Every navigator includes a "Pro-Tip" explaining the *why* behind the *how*.
- **Safe:** Commands are displayed and require confirmation before execution.
- **Modular:** Categorized by workflow phase (Safety, Collaboration, Advanced).
- **Zero Dependencies:** Pure Bash. Runs on macOS, Linux, and WSL.

---

## 🛠️ Quick Start

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/git-navigator.git
   cd git-navigator
   ```

2. **Run the Navigator:**
   ```bash
   ./navigator
   ```

---

## 🌍 Global Installation

To use Git Navigator in any repository on your machine, add a global Git alias:

1. **Navigate to the cloned folder:** `cd git-navigator`
2. **Run the alias command:**
   ```bash
   git config --global alias.navigator "!$(pwd)/navigator"
   ```


Now you can run **`git navigator`** from any project!

---

## 📖 Professional Runbooks

Step-by-step guides for common, high-value developer workflows:

- **[Contributing to a Project](docs/RUNBOOK_CONTRIBUTING.md):** A complete guide for forking, branching, and submitting PRs.
- **[Emergency Hotfix Deployment](docs/RUNBOOK_HOTFIX.md):** A rapid-response workflow for critical production bug fixes.
- **[Managing Complex PR History](docs/RUNBOOK_SQUASH_REBASE.md):** Advanced techniques for rebasing and cleaning up long-lived branches.

---

## 🔑 Multi-Account SSH Setup

Git Navigator includes a specialized tool for managing multiple GitHub identities (e.g., Personal vs. Work) on a single machine.

### How to use:
1. Run `./navigator`
2. Select **Safety & Hygiene**
3. Select **SSH & Identity Setup**

This will automate the generation of separate SSH keys and configure your `~/.ssh/config` with proper aliases.

### Manual Configuration:
If you prefer to run the setup script directly:
1. **Configure:** Edit the `CONFIGURATION` section in `navigators/safety/setup_github_keys.sh`.
2. **Execute:** `bash navigators/safety/setup_github_keys.sh`
3. **Add to GitHub:** Copy the outputted public keys to your [GitHub Settings](https://github.com/settings/keys).

---

## 📦 Workflow Suites

### [🛡️ Safety & Hygiene](docs/COMMANDS.md#️-safety--hygiene)
*Focus: Protecting your local work and fixing common mistakes.*
- **SSH & Identity Setup:** Automated multi-account GitHub configuration.
- **Conditional Git Identity (Auto-Email):** Automatically swap work/personal emails.
- **Fix Detached HEAD (Safe Re-attach):** Save work from a 'floating' state.
- **Nuclear Reset (Clean Slate):** Wipe all local mess and match the server.
- **Surgical Staging (Hunks):** Interactively select parts of files to commit.
- **Forget Tracked File:** Stop tracking a file without deleting it.
- **Clean Untracked Junk:** Quickly delete files and folders not in Git.
- **Fix Typo in Last Commit:** Safely amend your last commit message.
- **Undo Last Commit (Keep Changes):** Soft reset to un-commit without losing work.
- **Save Work to Stash:** Interactive stashing with descriptive messages.

### [🤝 Team Collaboration](docs/COMMANDS.md#-team-collaboration)
*Focus: Syncing with others and preparing for code review.*
- **Sync with Main (Rebase):** Safely pull and rebase from the main branch.
- **Auto-Squash (Clean PR History):** Combine 'oops' commits into one clean PR.
- **Compare Branches (Pre-PR):** Visual diff between your branch and main.
- **Surgical Cherry-Pick:** Pick a single fix from another branch.
- **Create Feature Branch:** Standardized `feature/` naming convention.
- **Add New Remote:** Connect to a new repository URL.
- **Update Remote URL:** Quickly swap the URL of an existing remote.
- **Remove Remote Connection:** Safely disconnect an old remote.
- **Cleanup Merged Branches:** Hygiene for your local repository.

### [🔍 Deep Dive & Recovery](docs/COMMANDS.md#-deep-dive--recovery)
*Focus: Power-user tools and emergency firefighting.*
- **Dangling Blob Recovery (God Mode):** Recover code that was never committed.
- **Bisect Wizard (Bug Hunter):** Find exactly which commit broke your build.
- **Search Code History:** The 'Pickaxe' search to find deleted functions.
- **Repo Health Audit:** Identify bloat and large files in your repository.
- **Emergency Recovery (Reflog):** Find "lost" commits after a bad rebase.
- **Multi-Task with Worktrees:** Manage multiple branches in separate directories.

---

## 🧪 Contributing

We welcome new navigators! To contribute:

1. Create a new `.sh` file in the appropriate category: `navigators/<category>/<your-navigator>.sh`.
2. Follow the "Navigator Pattern" (see `navigators/safety/undo-commit.sh` for a template).
3. Ensure you source `common/utils.sh` for logging and confirmation.
4. Submit a Pull Request!

---

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.
