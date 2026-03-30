# Runbook: Emergency Hotfix Deployment

This guide outlines a safe, rapid-response workflow for deploying critical bug fixes using the Git Navigator.

## 1. Prepare Your Workspace
- **Switch to Main:**
  - `git checkout main`
- **Ensure Clean Slate:**
  - Run `./navigator`
  - Select **Safety & Hygiene**
  - Select **Nuclear Reset (Clean Slate)** (This ensures you're on the absolute latest version from the server).

## 2. Start the Hotfix
- **Create Hotfix Branch:**
  - Run `./navigator`
  - Select **Team Collaboration**
  - Select **Create Feature Branch** (Use `hotfix/` as the name prefix).
- **Find the Bug:**
  - Run `./navigator`
  - Select **Deep Dive & Recovery**
  - Select **Bisect Wizard (Bug Hunter)** (Use this to pinpoint exactly which commit broke your production).

## 3. Develop & Test
- **Implement the Fix:** Write your code, tests, and documentation.
- **Save Work Temporarily:**
  - Run `./navigator`
  - Select **Safety & Hygiene**
  - Select **Save Work to Stash** (Use this if you're interrupted during development).

## 4. Final Verification
- **Compare Against Production:**
  - Run `./navigator`
  - Select **Team Collaboration**
  - Select **Compare Branches (Pre-PR)**.

---

## ✅ Verification

Before considering your hotfix "deployed," follow these verification steps:

### 1. Check Local History
```bash
git log -n 3 --oneline
```
Ensure your new commit has a clear, professional message.

### 2. Compare Branches
Run the Navigator and select **Compare Branches** to see exactly what you're merging:
```bash
./navigator
# Select Team Collaboration -> Compare Branches (Pre-PR)
```

### 3. Verify Remote Status
Ensure your work is safely on the server:
```bash
git status
# Should show "Your branch is up to date with 'origin/hotfix/...'"
```
Check your CI/CD pipeline and wait for a passing build.
