# 🚀 Quick Start - Your CV is Ready!

Congratulations! Your bilingual CV is now set up on GitHub Pages with automatic PDF generation. Here's what to do next:

## ✅ What's Already Done

- ✅ Created beautiful landing page (`index.html`) with language selection
- ✅ Set up GitHub Actions workflow for automatic LaTeX compilation
- ✅ Configured GitHub Pages deployment
- ✅ Pushed all changes to GitHub

## 🎯 Next 5 Minutes (Complete Setup)

### 1. Configure GitHub Pages (Repo Settings)

Visit: https://github.com/GHostQC/curriculum-vitae/settings/pages

**Set the following:**
- **Build and deployment > Source**: Select **"GitHub Actions"**
- Click **Save** (if prompted)

⚠️ **Important**: Make sure the source is set to **"GitHub Actions"** (not "Deploy from a branch" or "None")

### 2. Enable Workflow Permissions

Visit: https://github.com/GHostQC/curriculum-vitae/settings/actions/general

**Under "Workflow permissions":**
- ☑️ Enable **"Read and write permissions"**
- ☑️ Enable **"Allow GitHub Actions to create and approve pull requests"**
- Click **Save**

⚠️ **Important**: This allows the workflow to both build PDFs and commit them back to your repo

### 3. Watch the First Build

Visit: https://github.com/GHostQC/curriculum-vitae/actions

- You should see "Build PDFs and Deploy to GitHub Pages" workflow
- Click it to watch the build progress
- ⏱️ Takes about 2-3 minutes to compile LaTeX

### 4. Access Your CV Online

Once the workflow completes (green checkmark ✅):

**Website:** https://ghostqc.github.io/curriculum-vitae

You'll see:
- 🇨🇦 English button → downloads `devops_en_CA.pdf`
- 🇫🇷 French button → downloads `devops_fr_CA.pdf`

## 📝 Update Your CV

Whenever you want to update your CV:

1. Edit your `.tex` files locally:
   ```bash
   # Edit your CV content
   vim sections/en/devops_summary.tex
   vim sections/en/jobs/cleo_devops_developer.tex
   # (same for French files in sections/fr/)
   ```

2. Test locally (optional):
   ```bash
   make clean && make all
   ```

3. Commit and push:
   ```bash
   git add .
   git commit -m "Update CV content"
   git push origin main
   ```

4. GitHub Actions automatically:
   - Compiles LaTeX
   - Generates PDFs
   - Deploys to GitHub Pages
   - Done! ✨

## 🎨 Customize the Landing Page

Edit `index.html` to update:

**Your Name & Title:**
```html
<h1>Jean-Sébastien Pierre</h1>
<p class="subtitle">DevOps Engineer | Cloud Infrastructure</p>
```

**Social Links:** Update GitHub, LinkedIn, Email URLs

**Colors:** Change the gradient colors in the CSS

**Description:** Update your professional summary

See `GITHUB_PAGES_SETUP.md` for detailed customization options.

## 🔍 Monitoring & Troubleshooting

### Check Build Status
- Go to **Actions** tab on GitHub
- See workflow history and logs
- Debug any LaTeX compilation errors

### Manual Rebuild
If you want to rebuild without changing files:
1. Go to **Actions** tab
2. Click "Build PDFs and Deploy to GitHub Pages"
3. Click **Run workflow** button

### Common Issues & Solutions

**PDFs not showing on website?**
- Wait 2-3 minutes for GitHub Pages cache to update
- Hard refresh: `Cmd+Shift+R` (Mac) or `Ctrl+Shift+R` (Windows)

**Workflow failed?**
- Check the workflow logs in the Actions tab
- Common issue: LaTeX compilation error in `.tex` files
- Check build output for which file has the error

**Want to see more details?**
- See `GITHUB_PAGES_SETUP.md` for complete documentation

## 📊 File Summary

| File | Purpose |
|------|---------|
| `index.html` | Landing page with language selection |
| `.github/workflows/build-pdf.yml` | GitHub Actions workflow for auto-build |
| `.nojekyll` | GitHub Pages configuration |
| `sections/en/` | English CV source files |
| `sections/fr/` | French CV source files |
| `devops_en_CA.pdf` | Generated English PDF |
| `devops_fr_CA.pdf` | Generated French PDF |

## 💡 Pro Tips

1. **Share your CV URL:** `https://ghostqc.github.io/curriculum-vitae`
   - Professional, always up-to-date
   - Great for job applications and LinkedIn

2. **Use custom domain (optional):**
   - Get a domain (GitHub Pages supports custom domains free)
   - Configure in **Settings > Pages > Custom domain**

3. **Keep PDFs in git:**
   - The workflow auto-commits generated PDFs
   - They're tracked in version control for history

4. **Preview locally before pushing:**
   ```bash
   make clean && make all
   # Review the PDFs locally
   git push origin main  # When happy, push
   ```

## 🎓 What You Have Now

✨ **Complete bilingual CV system:**
- Professional GitHub Pages website
- One-click language switching
- Automatic PDF generation on every push
- All free GitHub tier features
- Zero dependencies besides LaTeX
- Version controlled CV history

## 📚 Learn More

- Full setup guide: `GITHUB_PAGES_SETUP.md`
- LaTeX CV structure: `README.md`
- Workflow details: `.github/workflows/build-pdf.yml`

---

**You're all set! 🎉 Just configure GitHub Pages settings (Steps 1-2 above) and you're done.**

Questions? See `GITHUB_PAGES_SETUP.md` for troubleshooting and detailed documentation.
