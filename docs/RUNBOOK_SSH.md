# Runbook: SSH Identity Management

This guide explains how to manage multiple GitHub identities (e.g., Personal vs. Work) on a single machine using SSH.

## 📖 The "Git Navigator" Way

The fastest way to set this up is to run the Git Navigator:
1. Run `./recipe`
2. Select **Safety & Hygiene**
3. Select **SSH & Identity Setup**

This will automatically trigger the `setup_github_keys.sh.` script and guide you through the process.

---

## 🛠️ Manual Execution

If you prefer to run the setup script directly:

### 1. Configure Personal/Work Info
Edit the `CONFIGURATION` section in `setup_github_keys.sh.`:
```bash
PERSONAL_EMAIL="your_personal_email@example.com"
WORK_EMAIL="your_work_email@company.com"
PERSONAL_REPO="username/personal-repo.git"
WORK_REPO="company/work-repo.git"
```

### 2. Run the Script
```bash
chmod +x setup_github_keys.sh.
./setup_github_keys.sh.
```

### 3. Add Keys to GitHub
The script will output your public keys. Copy them into your GitHub account:
- **Personal Account:** [GitHub SSH Keys Settings](https://github.com/settings/keys)
- **Work Account:** [GitHub SSH Keys Settings](https://github.com/settings/keys) (Note: Authorize for SSO if required by your organization).

### 4. How SSH Aliases Work
After setup, you should use the alias in your remotes instead of `github.com`:

| Scenario | Remote URL |
| :--- | :--- |
| **Personal** | `git@github-personal:username/repo.git` |
| **Work** | `git@github-work:company/repo.git` |

---

## ⚠️ Troubleshooting

- **Check Connection:** `ssh -T github-personal`
- **Verify Config:** `cat ~/.ssh/config`
- **Agent Check:** `ssh-add -l`
