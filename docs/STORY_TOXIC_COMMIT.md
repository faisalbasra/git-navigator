# The Toxic Commit: A Story of High-Stakes Security

You’re a junior developer, and it’s your first week on the job. You’re working on a new Python script that needs to connect to the company’s AWS cloud. You create a file called `secrets.json` and put the **AWS Root Access Key** inside.

You finish your work, add everything to Git, and commit. Two minutes later, you realize your mistake. You immediately delete the `secrets.json` file, create a *new* commit, and push everything to GitHub.

You think you’re safe. You "fixed" it, right?

---

## 🕵️ The Investigation: Is it Still There?

Ten minutes later, your phone rings. It’s the **Security Operations Center**. They’ve detected a leak.

The problem is that Git is a **Snapshot-Based System**. When you committed the `secrets.json` file, Git took a permanent snapshot of it. Even though you deleted the file in a *new* commit, the file is still sitting in the history. Anyone who clones the repo can go back to that one commit and see the AWS keys.

A "Toxic Commit" is now part of the company's permanent history.

---

## 🏗️ The Recovery: "Nuclear Surgery"

You remember the **Git Navigator** and its **Deep Dive & Recovery** suite.

1.  **Run the Wizard:** You select **Forget Tracked File** (Surgical approach) or use an advanced tool like `git filter-repo`.
2.  **The Technique:** You have to perform "Nuclear Surgery" on the history.
3.  **The Result:** You rewrite the entire project timeline. Git goes through every single commit from the beginning of time and removes the `secrets.json` file.

The repository history is scrubbed clean. The "Toxic Commit" has been surgically removed from the past.

---

## 📖 Using the Wizard in Git Navigator

Security is everyone's responsibility. Fix your history.
1. Run `./navigator`
2. Select **Safety & Hygiene**
3. Select **Forget Tracked File** (For individual files)
4. For deeper history scrubbing, refer to the **Deep Dive & Recovery** documentation.
