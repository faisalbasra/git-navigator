# Git Navigator Recipes

A collection of guided Git & GitHub recipes for various workflows, from basic safety to advanced recovery.

## Getting Started

The **Git Navigator** is an interactive CLI that guides you through common Git tasks. It explains the commands before you run them, making it ideal for learning and safe operations.

### How to use

1. Clone this repository.
2. Run the navigator:
   ```bash
   ./recipe
   ```
3. Select a workflow category:
   - **Safety & Hygiene**: Fix typos, undo commits, and manage local work safely.
   - **Team Collaboration**: (Coming Soon) PR preparation and syncing.
   - **Deep Dive & Recovery**: (Coming Soon) Advanced firefighting tools.

## Recipe Categories

### 🛡️ Safety & Hygiene
Perfect for protecting your work and fixing common local mistakes.
- **SSH & Identity Setup**: Automate your multi-account GitHub configuration.
- **Fix Typo in Last Commit**: Quickly amend your last commit message.
- **Undo Last Commit (Keep Changes)**: Soft reset to un-commit without losing work.
- **Save Work to Stash**: Safely store current changes for later.

---

## Contributing

To add a new recipe, simply create a new `.sh` file in the relevant category under `recipes/`. Use the template provided in `recipes/safety/undo-commit.sh` as a guide.
