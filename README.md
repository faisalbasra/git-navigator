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

## 📦 Workflow Suites

### 🛡️ Safety & Hygiene
*Focus: Protecting your local work and fixing common mistakes.*
- **SSH & Identity Setup:** Automated multi-account GitHub configuration.
- **Fix Typo in Last Commit:** Safely amend your last commit message.
- **Undo Last Commit (Keep Changes):** Soft reset to un-commit without losing work.
- **Save Work to Stash:** Interactive stashing with descriptive messages.

### 🤝 Team Collaboration
*Focus: Syncing with others and preparing for code review.*
- **Sync with Main (Rebase):** Safely pull and rebase from the main branch.
- **Create Feature Branch:** Standardized `feature/` naming convention.
- **Add New Remote:** Connect to a new repository URL.
- **Update Remote URL:** Quickly swap the URL of an existing remote.
- **Remove Remote Connection:** Safely disconnect an old remote.
- **Cleanup Merged Branches:** Hygiene for your local repository.

### 🔍 Deep Dive & Recovery
*Focus: Power-user tools and emergency firefighting.*
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
