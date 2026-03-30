#!/bin/bash

# =========================
# CONFIGURATION - EDIT THESE
# =========================

PERSONAL_EMAIL="your_personal_email@example.com"
WORK_EMAIL="your_work_email@company.com"

PERSONAL_REPO="username/personal-repo.git"   # Example: your personal GitHub repo
WORK_REPO="company/work-repo.git"           # Example: your work GitHub repo

# =========================
# 1. Generate SSH keys
# =========================

echo "Generating SSH keys..."

ssh-keygen -t ed25519 -C "$PERSONAL_EMAIL" -f ~/.ssh/id_ed25519_personal -N ""
ssh-keygen -t ed25519 -C "$WORK_EMAIL" -f ~/.ssh/id_ed25519_work -N ""

# =========================
# 2. Start ssh-agent and add keys
# =========================

echo "Starting ssh-agent and adding keys..."
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519_personal
ssh-add ~/.ssh/id_ed25519_work

# =========================
# 3. Create SSH config
# =========================

echo "Creating ~/.ssh/config..."
cat >> ~/.ssh/config <<EOL
# Personal GitHub
Host github-personal
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_personal

# Work GitHub
Host github-work
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_work
EOL

chmod 600 ~/.ssh/config

# =========================
# 4. Add SSH keys to GitHub (manual)
# =========================

echo "Copy the following keys to GitHub:"
echo "Personal key:"
cat ~/.ssh/id_ed25519_personal.pub
echo ""
echo "Work key (authorize for org if using SAML SSO):"
cat ~/.ssh/id_ed25519_work.pub

# =========================
# 5. Setup example repo remotes
# =========================

echo "Setting up example remotes (you can skip if repos already exist)..."
mkdir -p ~/projects/personal-repo ~/projects/work-repo
cd ~/projects/personal-repo
git init
git remote add origin git@github-personal:$PERSONAL_REPO
cd ~/projects/work-repo
git init
git remote add origin git@github-work:$WORK_REPO

# =========================
# 6. Test SSH connections
# =========================

echo ""
echo "Testing SSH connections..."
ssh -T github-personal
ssh -T github-work

echo ""
echo "✅ Setup complete! Remember to push test commits to ensure everything works."