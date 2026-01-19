# GitHub Pages Setup Guide

Your CV is now set up to be automatically built and deployed to GitHub Pages with bilingual support (English & French).

## What's Been Set Up

### 1. **Landing Page** (`index.html`)
- Beautiful, responsive homepage with language selection
- Two-button interface to download English (🇨🇦) or French (🇫🇷) CVs
- Social media links (GitHub, LinkedIn, Email)
- Displays last update timestamp

### 2. **Automatic PDF Generation** (`.github/workflows/build-pdf.yml`)
- GitHub Actions workflow triggers on every push to `main`
- Automatically compiles LaTeX files using `make all`
- Generates both English and French PDFs
- Commits generated PDFs back to the repository
- Deploys to GitHub Pages

### 3. **GitHub Pages Configuration** (`.nojekyll`)
- Ensures GitHub Pages serves files as-is without Jekyll processing
- Allows PDF files to be served correctly

## Quick Setup Instructions

### Step 1: Configure GitHub Pages in Your Repository

1. Go to your repository on GitHub: https://github.com/GHostQC/curriculum-vitae
2. Click **Settings** (gear icon)
3. Navigate to **Pages** (left sidebar)
4. Under "Build and deployment":
   - **Source**: Select "GitHub Actions"
   - This enables deployment from the GitHub Actions workflow

### Step 2: Enable Write Permissions for GitHub Actions

1. In **Settings** → **Actions** → **General**
2. Under "Workflow permissions", enable:
   - ✅ **Read and write permissions**
   - ✅ **Allow GitHub Actions to create and approve pull requests**
3. Click **Save**

### Step 3: Commit and Push Changes

```bash
cd /Users/jstpierre/perso/jsp-cv

# Stage all new files
git add index.html .github/workflows/build-pdf.yml .nojekyll

# Commit
git commit -m "chore: set up GitHub Pages with automatic LaTeX compilation

- Add index.html landing page with language selection
- Add GitHub Actions workflow for PDF generation
- Configure .nojekyll for proper GitHub Pages deployment
- PDFs automatically rebuild on source changes"

# Push to GitHub
git push origin main
```

### Step 4: Monitor the First Build

1. Go to your repository
2. Click the **Actions** tab
3. You should see the "Build PDFs and Deploy to GitHub Pages" workflow running
4. Wait for it to complete (usually 2-3 minutes for LaTeX compilation)
5. Once completed, check the deployment status

### Step 5: Access Your CV Online

Once deployment completes successfully:
- **Website**: https://ghostqc.github.io/curriculum-vitae
- Click English (🇨🇦) to view `devops_en_CA.pdf`
- Click Français (🇫🇷) to view `devops_fr_CA.pdf`

## How It Works

### Automatic Builds
Every time you push to the `main` branch with changes to:
- `.tex` files in `sections/`
- `devops_en_CA.tex` or `devops_fr_CA.tex`
- `Makefile`

The workflow will:
1. ✅ Check out your code
2. ✅ Install LaTeX (`texlive-full` + `latexmk`)
3. ✅ Run `make clean && make all`
4. ✅ Generate PDFs
5. ✅ Commit updated PDFs (auto-commit)
6. ✅ Deploy to GitHub Pages

### Workflow Trigger Conditions
The workflow only runs when:
- Push happens on the `main` branch
- Changed files match the specified paths
- This avoids unnecessary builds for documentation-only changes

### Manual Workflow Triggers
If you want to trigger a build manually:
1. Go to **Actions** tab
2. Select "Build PDFs and Deploy to GitHub Pages"
3. Click **Run workflow** → **Run workflow**

## Customization

### Update Personal Information in `index.html`

Edit the following sections in `index.html`:

**Your Name & Title:**
```html
<h1>Jean-Sébastien Pierre</h1>
<p class="subtitle">DevOps Engineer | Cloud Infrastructure</p>
```

**Description:**
```html
<p>💼 <strong>DevOps Engineer</strong> with expertise in...</p>
<p>📍 Based in Canada | Open to remote opportunities</p>
<p>🔧 Specializing in AWS, Kubernetes, Terraform...</p>
```

**Social Links:**
Update GitHub, LinkedIn, and Email URLs in the social links section:
```html
<a href="https://github.com/YOUR_GITHUB_USERNAME" title="GitHub" target="_blank">
<a href="https://linkedin.com/in/YOUR_PROFILE" title="LinkedIn" target="_blank">
<a href="mailto:your-email@example.com" title="Email">
```

### Change Colors

Edit the gradient colors in `index.html` CSS:

**Blue gradient (English button):**
```css
background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
```

**Pink gradient (French button):**
```css
background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
```

Find more color gradients at: https://uigradients.com/

### Custom Domain (Optional)

To use a custom domain (e.g., `mycv.com`):

1. Go to **Settings** → **Pages**
2. Under "Custom domain", enter your domain
3. Update DNS records with GitHub's instructions
4. GitHub will automatically handle HTTPS

## Troubleshooting

### PDFs Not Generating

**Check the workflow logs:**
1. Go to **Actions** tab
2. Click the failed workflow run
3. Click **build** job
4. Check the "Build PDFs" step for errors

**Common issues:**
- Missing LaTeX packages: The `texlive-full` package should include everything
- Syntax errors in `.tex` files: Check the build output for error messages
- Missing dependency files: Ensure all referenced files exist

### PDFs Not Displaying on Website

1. Verify `.nojekyll` file exists in root
2. Check that PDFs are committed to the repository
3. Wait a few minutes for GitHub Pages cache to update
4. Hard refresh your browser (Cmd+Shift+R on Mac)

### Workflow Permissions Issues

If you see "permission denied" errors:
1. Go to **Settings** → **Actions** → **General**
2. Ensure "Read and write permissions" is enabled
3. Re-run the workflow

## Next Steps

### 1. Verify Everything Works
```bash
# Build locally to verify
make clean
make all

# Check that PDFs were generated
ls -lh *.pdf
```

### 2. Update Resume Content
- Edit your work experience in `sections/en/jobs/` and `sections/fr/jobs/`
- Edit your summary, skills, education as needed
- Push changes → PDFs auto-generate

### 3. Share Your CV
- Share the GitHub Pages URL: `https://ghostqc.github.io/curriculum-vitae`
- It's a great way to showcase your work to employers!

### 4. Set Up Custom Domain (Optional)
- Adds more professionalism to your CV
- Point your domain to GitHub Pages

## File Structure Overview

```
/
├── index.html                          # Landing page (GitHub Pages entry point)
├── .nojekyll                           # Disables Jekyll processing
├── .github/
│   └── workflows/
│       └── build-pdf.yml               # GitHub Actions workflow
├── devops_en_CA.pdf                    # Generated English PDF
├── devops_fr_CA.pdf                    # Generated French PDF
├── devops_en_CA.tex                    # English CV source
├── devops_fr_CA.tex                    # French CV source
├── build-info.json                     # Auto-generated by workflow
└── sections/                           # Modular CV sections
    ├── preamble.tex
    ├── en/
    │   ├── title.tex
    │   ├── devops_summary.tex
    │   ├── devops_experience.tex
    │   ├── skills.tex
    │   ├── education.tex
    │   └── jobs/
    │       ├── cleo_devops_developer.tex
    │       ├── ads_devops_engineer.tex
    │       ├── ovh_sysadmin.tex
    │       └── telebec_tech.tex
    └── fr/
        └── (same structure as en/)
```

## Environment Info

- **Workflow OS**: Ubuntu Latest
- **LaTeX Distribution**: `texlive-full`
- **Build Tool**: `latexmk`
- **Language**: Bash scripts
- **CI/CD**: GitHub Actions

## Security & Privacy Notes

✅ **Safe to commit PDFs**: GitHub free tier allows unlimited public repositories
✅ **Automatic updates**: GitHub Actions runs on free tier
✅ **No external dependencies**: Everything built using free tools
✅ **Public by default**: Your CV will be publicly accessible (as intended for a resume)

## Support & Resources

- **GitHub Pages Docs**: https://docs.github.com/en/pages
- **GitHub Actions Docs**: https://docs.github.com/en/actions
- **LaTeX Documentation**: https://www.latex-project.org/help/documentation/

## Summary

You now have:
✅ A professional GitHub Pages landing page for your CV  
✅ Automatic PDF generation and deployment  
✅ Bilingual support (English & French)  
✅ One-click PDF downloads  
✅ Everything using GitHub's free tier  

Just push your changes and let GitHub Actions handle the rest! 🚀
