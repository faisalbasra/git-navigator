# The Secret Identity: A Story of Professional Separation

You're a senior developer who loves contributing to the open-source world. For three months, you've been a key contributor to a popular JavaScript library. Your commits are high-quality, and the maintainers respect you.

One day, you receive an urgent email from your company’s Legal Department. They’ve noticed that your contributions to this project are being made with your **corporate work email** (`you@corporation.com`) instead of your personal one.

Because of this, the company's lawyers are concerned that the corporation technically "owns" your open-source work, and the library maintainers are worried about a potential lawsuit.

---

## 🕵️ The Investigation: How did this happen?

You check your global `.gitconfig`. It’s set to:
```ini
[user]
    email = you@corporation.com
    name = Your Name
```

Whenever you work in your `~/work/` folder or your `~/personal/` folder, Git uses the same global identity. It’s a simple mistake that can have massive legal consequences.

---

## 🏗️ The Solution: Automated Identity Swapping

You remember the **Git Navigator** and its **Safety & Hygiene** suite.

1.  **Run the Wizard:** You select **Conditional Git Identity (Auto-Email)**.
2.  **The Technique:** You set up a rule in your `.gitconfig` called **`includeIf`**.
3.  **The Configuration:**
    - Git now says: "If the user is working in the `~/work/` directory, use the **Work** config."
    - "Otherwise, use the **Global** (Personal) config."

You never have to remember to run `git config user.email` again. Your work stays at work, and your personal life stays personal.

---

## ✅ Verification & Troubleshooting

After running the wizard, you can verify your configuration and troubleshoot any issues.

### 1. Verify Your Global (Personal) Email
Run this command from your personal project directory (e.g., outside your work directory):
```bash
# Should show your personal email
git config user.email
```

### 2. Verify Your Work Email
Navigate to a directory under your defined work path (e.g., `~/work/`) and check the email there. Since Git needs a repository to apply the `includeIf` logic, you'll need to be inside a Git repo:
```bash
cd ~/work/any-repo
git config user.email
```

### 3. See the Source of Your Configuration
To see exactly *where* Git is getting your email address from (which config file), use:
```bash
git config --list --show-origin | grep user.email
```
*   In your **personal** folders, it should show: `file:/Users/your-user/.gitconfig`
*   In your **work** folders, it should show: `file:/Users/your-user/.gitconfig-work`

### 🛠️ Common Fixes

- **"My work email isn't showing up!"**
  - Make sure you are inside a **Git repository**. The `includeIf` logic only triggers when Git can see the repository path.
  - Check the directory path in your `~/.gitconfig`. It must end with a trailing slash (e.g., `[includeIf "gitdir:~/work/"]`).
  - Verify that `~/.gitconfig-work` exists and has the correct `[user]` section.
- **"I want to change my work email/name."**
  - Simply edit `~/.gitconfig-work` directly. No need to run the wizard again!
