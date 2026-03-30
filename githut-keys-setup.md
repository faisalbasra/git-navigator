step- 1
Here’s a one-shot setup script that you can run on a new machine. It handles:

Generating SSH keys (personal & work)
Adding them to the ssh-agent
Creating ~/.ssh/config with proper aliases
Setting up example remotes for personal and work repos
Testing connections


step-2
How to use:
Edit the script at the top with your emails and example repo paths.
Save as setup_github_keys.sh.
Run:
chmod +x setup_github_keys.sh
./setup_github_keys.sh
Copy the SSH keys into GitHub accounts. For work, authorize the key for SAML SSO if needed.
Test by pushing/pulling from your repos.