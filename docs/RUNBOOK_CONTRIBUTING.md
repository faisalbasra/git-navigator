# Runbook: Contributing to a Project

This guide outlines the standard workflow for contributing code to this (or any) project using Git Navigator.

## 1. Prepare Your Environment
- **Fork the Repository:** Create your own copy of the project on GitHub.
- **Clone Locally:** `git clone https://github.com/your-username/repo.git`
- **Add Upstream Remote:** 
  - Run `./navigator`
  - Select **Team Collaboration**
  - Select **Add New Remote** (Use the original project's URL as `upstream`).

## 2. Start Your Feature
- **Create a Branch:**
  - Run `./navigator`
  - Select **Team Collaboration**
  - Select **Create Feature Branch**.
- **Do the Work:** Write your code, tests, and documentation.

## 3. Keep Your Branch Synced
- **Pull from Upstream:**
  - Run `./navigator`
  - Select **Team Collaboration**
  - Select **Sync with Main (Rebase)**.

## 4. Prepare for Code Review
- **Stage Surgically:**
  - Run `./navigator`
  - Select **Safety & Hygiene**
  - Select **Surgical Staging (Hunks)**.
- **Clean Up Your History:**
  - Run `./navigator`
  - Select **Team Collaboration**
  - Select **Auto-Squash (Clean PR History)**.
- **Final Self-Review:**
  - Run `./navigator`
  - Select **Team Collaboration**
  - Select **Compare Branches (Pre-PR)**.

## 5. Submit Your Work
- **Push to Fork:** `git push origin feature/your-feature-name`
- **Open a Pull Request:** Navigate to GitHub and submit your PR!
