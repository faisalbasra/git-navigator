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

## 📖 Using the Wizard in Git Navigator

Be a professional. Automate your identity.
1. Run `./navigator`
2. Select **Safety & Hygiene**
3. Select **Conditional Git Identity (Auto-Email)**
4. Follow the prompts to set up your work/personal folders.
