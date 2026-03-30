# Runbook: Managing Complex Pull Request History

This guide outlines advanced workflows for cleaning up and rebasing long-lived feature branches using the Git Navigator.

## 1. Prepare Your Feature Branch
- **Sync with Upstream:**
  - Run `./navigator`
  - Select **Team Collaboration**
  - Select **Sync with Main (Rebase)**.

## 2. Combine Intermediate Commits
- **Squash Commits:**
  - Run `./navigator`
  - Select **Team Collaboration**
  - Select **Auto-Squash (Clean PR History)**.
- **Port Specific Fixes:**
  - Run `./navigator`
  - Select **Team Collaboration**
  - Select **Surgical Cherry-Pick** (Use this to pull specific commits into your branch).

## 3. Review Your History
- **Search History:**
  - Run `./navigator`
  - Select **Deep Dive & Recovery**
  - Select **Search Code History** (Find specific additions or deletions in your PR).
- **Check Repository Health:**
  - Run `./navigator`
  - Select **Deep Dive & Recovery**
  - Select **Repo Health Audit** (Ensure your history isn't bloated with large files).

## 4. Final Verification
- **Compare Against Main:**
  - Run `./navigator`
  - Select **Team Collaboration**
  - Select **Compare Branches (Pre-PR)**.

---

## ✅ Verification

After cleaning up your PR history, you must verify that the changes are correct and your history is clean:

### 1. Check Your History
```bash
git log --oneline --graph --all -n 5
```
Ensure that all of your intermediate commits are squashed into a single, clean commit.

### 2. Compare Against Main
```bash
git diff main...HEAD --name-only
```
Verify that only the files you intended to change are listed.

### 3. Check Repository Bloat
If you've removed large files, check the repository size:
```bash
./navigator
# Select Deep Dive & Recovery -> Repo Health Audit
```
Verify that the repository history is clean and hasn't grown unnecessarily.
