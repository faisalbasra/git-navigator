# 🧭 Git Navigator: Command Reference

This document provides a detailed breakdown of every navigator included in the Git Navigator CLI.

---

## 🛡️ Safety & Hygiene
*Tools for protecting your local work and fixing common mistakes.*

### 🔑 SSH & Identity Setup
- **Command:** `ssh-keygen` & `~/.ssh/config`
- **Description:** Automates the generation of separate SSH keys for personal and work accounts and configures aliases in your SSH config.
- **Pro-Tip:** Use aliases like `github-work` in your remote URLs to ensure the correct identity is used automatically.

### 📧 Conditional Git Identity (Auto-Email)
- **Command:** `[includeIf "gitdir:~/work/"]`
- **Description:** Sets up rules in your global `.gitconfig` to automatically swap your Git email and name based on the folder you are in.
- **Pro-Tip:** This prevents the common mistake of committing to a corporate repository with a personal email.

### ⚓ Fix Detached HEAD (Safe Re-attach)
- **Command:** `git checkout -b [temp-branch]`
- **Description:** If you accidentally made commits while "detached" from a branch, this navigator saves that work to a new, real branch.
- **Pro-Tip:** Never leave a detached HEAD state without saving your work first!

### ☢️ Nuclear Reset (Clean Slate)
- **Command:** `git fetch origin && git reset --hard origin/[branch]`
- **Description:** Discards all local changes and force-syncs your branch with the server.
- **Pro-Tip:** This is the ultimate "emergency exit" when your local environment is hopelessly messy.

### ✂️ Surgical Staging (Hunks)
- **Command:** `git add -p`
- **Description:** Allows you to review every change and decide which specific parts (hunks) to include in your next commit.
- **Pro-Tip:** This is the best way to ensure your commits are clean, focused, and free of "temporary debug" code.

### 🙈 Forget Tracked File
- **Command:** `git rm --cached [filename]`
- **Description:** Untracks a file from Git without deleting it from your local computer.
- **Pro-Tip:** Use this to remove accidentally committed `.env` files or build artifacts.

### 🧹 Clean Untracked Junk
- **Command:** `git clean -fd`
- **Description:** Deletes all files and folders in your workspace that are not tracked by Git.
- **Pro-Tip:** Great for cleaning up after a build process or a massive file operation.

### ✍️ Fix Typo in Last Commit
- **Command:** `git commit --amend -m "[message]"`
- **Description:** Replaces the last commit with a new message.
- **Pro-Tip:** Only use this on commits that have NOT been pushed to a shared repository.

### ⏪ Undo Last Commit (Keep Changes)
- **Command:** `git reset --soft HEAD~1`
- **Description:** Un-commits your last change but keeps all your files modified and staged.
- **Pro-Tip:** Perfect for when you committed too early and want to add more changes to the same commit.

### 📦 Save Work to Stash
- **Command:** `git stash save "[description]"`
- **Description:** Safely stores your uncommitted changes in temporary storage.
- **Pro-Tip:** Use descriptive stash messages so you can easily find your work later with `git stash list`.

---

## 🤝 Team Collaboration
*Tools for syncing with others and preparing for professional code review.*

### 🔄 Sync with Main (Rebase)
- **Command:** `git fetch origin main && git rebase origin/main`
- **Description:** Updates your branch with the latest changes from main while keeping a linear history.
- **Pro-Tip:** Rebasing is preferred over merging for a cleaner, easier-to-read project history.

### 🔨 Auto-Squash (Clean PR History)
- **Command:** `git rebase -i [base]`
- **Description:** An interactive wizard to help you combine multiple small or "oops" commits into one professional commit.
- **Pro-Tip:** Use this to hide your "work-in-progress" commits before a code review.

### ⚖️ Compare Branches (Pre-PR)
- **Command:** `git diff main...[branch]`
- **Description:** Shows exactly what has changed between your feature branch and the main branch since they diverged.
- **Pro-Tip:** Always perform a final self-review using this tool before opening a Pull Request.

### 🍒 Surgical Cherry-Pick
- **Command:** `git cherry-pick [hash]`
- **Description:** Picks a single commit from another branch and applies it to your current one.
- **Pro-Tip:** Use this to port a bug fix into an older release branch without merging the entire feature.

### 🌿 Create Feature Branch
- **Command:** `git checkout -b feature/[name]`
- **Description:** Creates a new branch using the standard `feature/` naming convention.
- **Pro-Tip:** Standardized naming makes it easier for teammates and CI/CD tools to identify your work.

### ➕ Add New Remote
- **Command:** `git remote add [name] [url]`
- **Description:** Connects your local repository to a new remote server.
- **Pro-Tip:** Use this to add "upstream" remotes when working on forked repositories.

### 📝 Update Remote URL
- **Command:** `git remote set-url [name] [url]`
- **Description:** Changes the URL of an existing remote.
- **Pro-Tip:** Essential if your project moves from one organization to another on GitHub.

### ✂️ Remove Remote Connection
- **Command:** `git remote remove [name]`
- **Description:** Disconnects your local repo from a remote server without deleting any code.
- **Pro-Tip:** Clean up old remotes to keep your `git remote -v` output readable.

### 🧹 Cleanup Merged Branches
- **Command:** `git remote prune origin && git branch --merged`
- **Description:** Safely deletes local branches that have already been merged into your current branch.
- **Pro-Tip:** Run this once a week to keep your local branch list manageable.

---

## 🔍 Deep Dive & Recovery
*Power-user tools for forensic debugging and repository auditing.*

### 🦴 Dangling Blob Recovery (God Mode)
- **Command:** `git fsck --lost-found`
- **Description:** Scans the Git database for "dangling" code that was staged but never committed.
- **Pro-Tip:** This is your "Last Hope" tool for recovering code after an accidental `git reset --hard`.

### 🐞 Bisect Wizard (Bug Hunter)
- **Command:** `git bisect start/good/bad`
- **Description:** Uses binary search to find exactly which commit introduced a bug.
- **Pro-Tip:** This is the fastest way to debug regressions in large codebases.

### 🔍 Search Code History
- **Command:** `git log -S "[string]"`
- **Description:** Finds the exact commits where a specific string was added or deleted.
- **Pro-Tip:** The "Pickaxe" search is invaluable for finding *when* a function was removed and *why*.

### 🏥 Repo Health Audit
- **Command:** `git count-objects -vH`
- **Description:** Audits your repository for bloat, large files, and deep history.
- **Pro-Tip:** Use this to identify large binary files that should be moved to Git LFS.

### 🆘 Emergency Recovery (Reflog)
- **Command:** `git reflog`
- **Description:** A detailed log of every time your HEAD moved.
- **Pro-Tip:** If you think you've "deleted" a branch, it's almost always still visible in the reflog.

### 🏗️ Multi-Task with Worktrees
- **Command:** `git worktree add [path] [branch]`
- **Description:** Allows you to have multiple branches checked out in different folders simultaneously.
- **Pro-Tip:** Perfect for jumping to a hotfix without having to stash your current feature work.
