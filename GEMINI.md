# GEMINI.md

## Project Overview

This project is a collection of recipes and utilities for Git and GitHub workflows. Its primary focus is on managing multiple GitHub identities (e.g., personal vs. work) on the same machine through SSH key management and configuration.

The project provides an automated setup script and documentation for:
- Generating separate SSH keys for different identities.
- Configuring the SSH agent and `~/.ssh/config` for alias-based repository access.
- Setting up local repository remotes with custom SSH aliases.
- Testing SSH connections to GitHub.

## Key Files

- `setup_github_keys.sh.`: A shell script that automates the process of generating SSH keys and configuring them for dual personal/work GitHub accounts.
- `githut-keys-setup.md`: Documentation that guides users through the process of setting up multiple GitHub identities using the provided script.
- `README.md`: Basic project introduction.
- `LICENSE`: Project license file.

## Usage

### 1. Setting up GitHub Keys for Multiple Accounts

The `setup_github_keys.sh.` script is designed for a one-shot setup on a new machine.

**Preparation:**
- Open `setup_github_keys.sh.` and edit the `CONFIGURATION` section at the top with your personal and work emails and sample repository paths.

**Execution:**
1. Make the script executable: `chmod +x setup_github_keys.sh.`
2. Run the script: `./setup_github_keys.sh.`
3. Copy the outputted public keys (personal and work) to your respective GitHub account settings.
4. If your work account uses SAML SSO, remember to authorize the new key.

**How it works:**
The script creates two entries in your `~/.ssh/config`:
- `github-personal` (using `~/.ssh/id_ed25519_personal`)
- `github-work` (using `~/.ssh/id_ed25519_work`)

When cloning or adding remotes, you should use the alias instead of `github.com`. For example:
`git remote add origin git@github-work:company/repo.git`

## Development Conventions

This is a non-code project primarily consisting of shell scripts and documentation.
- **Scripting:** Ensure any new shell scripts follow the style of `setup_github_keys.sh.`—clear comments, configuration sections at the top, and user-friendly output.
- **Documentation:** Use Markdown for any new guides or recipes.
