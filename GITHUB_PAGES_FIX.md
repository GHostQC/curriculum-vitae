# 🔧 Fix GitHub Pages - Step-by-Step with Screenshots

The workflow is failing because **GitHub Pages is still using Jekyll by default**. We need to change ONE setting.

## Step 1: Open Your Repository Settings

1. Go to your GitHub repo: https://github.com/GHostQC/curriculum-vitae
2. Click the **Settings** tab (gear icon on the right)

## Step 2: Navigate to Pages Settings

3. In the left sidebar, scroll down and click **Pages** (under "Code and automation")

You should now see a page that looks like this:

```
GitHub Pages

Build and deployment
Source: [dropdown showing options]
```

## Step 3: Change the Source (THIS IS THE KEY STEP)

4. Look at the **Source** dropdown
5. Currently it probably says: **"Deploy from a branch"** or **"None"**
6. Click the dropdown and select: **"GitHub Actions"**

**Visual Guide:**
```
Source: Deploy from a branch  ← You'll see this dropdown
        ↓ (click here)
        ┌─────────────────────┐
        │ Deploy from a branch │ ← This is selected (WRONG)
        │ GitHub Actions      │ ← Select THIS ONE
        │ None                │
        └─────────────────────┘
```

7. **Click on "GitHub Actions"** in the dropdown

## Step 4: Save (if there's a Save button)

- Usually GitHub Pages settings save automatically
- If you see a **Save** button, click it
- The page should refresh

## Step 5: Verify the Change

- The "Source" section should now show **"GitHub Actions"** as selected
- You should see a message about your site being published

## Step 6: Trigger the Workflow

Now that the source is set to GitHub Actions, let's manually trigger the workflow:

1. Go to the **Actions** tab in your repo
2. You'll see "Build PDFs and Deploy to GitHub Pages" listed
3. Click on it
4. Click the **"Run workflow"** button (on the right)
5. In the dropdown that appears, click **"Run workflow"** again

You should see the workflow start running!

## Step 7: Monitor the Build

1. You're still on the workflow page - you'll see it running
2. Watch for the blue "running" indicator to turn green (✅)
3. This takes about **2-3 minutes** because LaTeX compilation is slow
4. Once green, your site is live!

## Step 8: Access Your CV

Once the workflow shows ✅ green:

**Go to:** https://ghostqc.github.io/curriculum-vitae

You should see:
- Your name and title
- Two buttons:
  - 🇨🇦 **English** button (downloads English PDF)
  - 🇫🇷 **Français** button (downloads French PDF)

---

## 🆘 Still Not Working?

**If you get stuck on Step 3 (can't find the Pages settings):**

1. Make sure you're in **Settings** → **Pages** (not General settings)
2. You should see "Build and deployment" section prominently
3. The Source dropdown should be right there

**If the dropdown doesn't show "GitHub Actions" as an option:**

1. You might have a free account that doesn't support GitHub Actions
2. Or there might be repo protection rules blocking it
3. Contact GitHub support or check repository settings permissions

**If the workflow still fails after changing the source:**

1. Go to **Settings** → **Actions** → **General**
2. Scroll to "Workflow permissions"
3. Make sure **"Read and write permissions"** is enabled ✅
4. Click **Save**
5. Re-run the workflow

---

## Quick Checklist

- [ ] Opened repo Settings
- [ ] Clicked Pages in left sidebar
- [ ] Found the Source dropdown under "Build and deployment"
- [ ] Changed Source to "GitHub Actions"
- [ ] Went to Actions tab
- [ ] Manually ran the workflow
- [ ] Watched it turn green (2-3 min)
- [ ] Visited https://ghostqc.github.io/curriculum-vitae
- [ ] Saw the landing page with language buttons ✨

---

**That's it! Once you complete these steps, your bilingual CV will be live! 🚀**
