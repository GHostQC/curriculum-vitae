# CV Translation Setup - Modular & Composable Architecture

A clean, modular approach to managing multiple CV versions in different languages using pure LaTeX and Makefile. Build exactly the CV you need by composing individual sections and jobs.

## Architecture

```
sections/
├── preamble.tex                        # Common LaTeX setup (packages, environments)
├── en/                                 # English section libraries
│   ├── title.tex
│   ├── devops_summary.tex
│   ├── devops_experience.tex          # COMPOSABLE: includes/excludes jobs via input
│   ├── skills.tex
│   ├── education.tex
│   └── jobs/                          # Individual job listings
│       ├── cleo_devops_developer.tex
│       ├── ads_devops_engineer.tex
│       ├── ovh_sysadmin.tex
│       └── telebec_tech.tex           # ARCHIVED - can be uncommented
└── fr/                                # French section libraries (same structure)
    ├── title.tex
    ├── devops_summary.tex
    ├── devops_experience.tex
    ├── skills.tex
    ├── education.tex
    └── jobs/
        ├── cleo_devops_developer.tex
        ├── ads_devops_engineer.tex
        ├── ovh_sysadmin.tex
        └── telebec_tech.tex

devops_en_CA.tex                       # English CV (composes en/ sections)
devops_fr_CA.tex                       # French CV (composes fr/ sections)
devops.tex                             # Default CV (synced to en_CA or fr_CA)
```

## Why This Approach?

✅ **Truly Modular** - Each job is its own file, can be independently included/excluded  
✅ **Composable** - Pick and choose which jobs appear in each CV  
✅ **Easy Archiving** - Comment out old jobs, uncomment when needed  
✅ **Scalable** - Create new CV types and job variants in seconds  
✅ **Multi-language** - All sections duplicated in `sections/en/` and `sections/fr/`  
✅ **DRY** - Preamble shared across all versions, zero duplication  
✅ **No Dependencies** - Pure LaTeX + Make, nothing else needed  

## Quick Start

### Build All Versions
```bash
make
```
Builds all three PDFs: English, French, and default.

### Build Specific Language
```bash
make en    # Build English only
make fr    # Build French only
```

### Set Default Language
```bash
make set-en    # Use English as default (updates devops.tex and builds devops.pdf)
make set-fr    # Use French as default (updates devops.tex and builds devops.pdf)
```

### Clean Up
```bash
make clean       # Remove build artifacts (keep PDFs)
make distclean   # Remove all generated files (PDFs + artifacts)
```

## Composing Your Own Experience Section

The experience section is fully composable. You control which jobs appear in your CV:

### Current Setup (3 jobs)
```tex
% sections/en/devops_experience.tex

\section{Work Experience}

\input{sections/en/jobs/cleo_devops_developer}
\input{sections/en/jobs/ads_devops_engineer}
\input{sections/en/jobs/ovh_sysadmin}
% \input{sections/en/jobs/telebec_tech}  % Archived - uncomment to include
```

### Include Archived Télébec Job
Simply uncomment the line:
```tex
\section{Work Experience}

\input{sections/en/jobs/cleo_devops_developer}
\input{sections/en/jobs/ads_devops_engineer}
\input{sections/en/jobs/ovh_sysadmin}
\input{sections/en/jobs/telebec_tech}  % Now included!
```

Then rebuild:
```bash
make en  # Rebuild English with all 4 jobs
```

### Change Job Order
The order jobs appear in the CV is the order you list them:
```tex
% Most recent first (default, reverse chronological)
\input{sections/en/jobs/cleo_devops_developer}        % 2023-Present
\input{sections/en/jobs/ads_devops_engineer}          % 2017-2023
\input{sections/en/jobs/ovh_sysadmin}                 % 2013-2016

% Or chronological order:
\input{sections/en/jobs/telebec_tech}                 % 2012-2013
\input{sections/en/jobs/ovh_sysadmin}                 % 2013-2016
\input{sections/en/jobs/ads_devops_engineer}          % 2017-2023
\input{sections/en/jobs/cleo_devops_developer}        % 2023-Present
```

## Creating New CV Variants

### Example 1: Adding Archived Télébec Job

1. **Uncomment in experience section:**
   ```tex
   % sections/en/devops_experience.tex
   \input{sections/en/jobs/telebec_tech}
   ```

2. **Do the same for French:**
   ```tex
   % sections/fr/devops_experience.tex
   \input{sections/fr/jobs/telebec_tech}
   ```

3. **Build:**
   ```bash
   make
   ```

### Example 2: Create New CV Type (e.g., Sysadmin)

1. **Create new section files:**
   ```
   sections/en/sysadmin_summary.tex
   sections/en/sysadmin_experience.tex
   sections/fr/sysadmin_summary.tex
   sections/fr/sysadmin_experience.tex
   ```

2. **Create individual job files:**
   ```
   sections/en/jobs/ovh_sysadmin.tex     (reuse existing!)
   sections/en/jobs/telebec_tech.tex     (reuse existing!)
   sections/fr/jobs/ovh_sysadmin.tex
   sections/fr/jobs/telebec_tech.tex
   ```

3. **Create top-level CV file:**
   ```tex
   % sysadmin_en_CA.tex
   \input{sections/preamble}
   \begin{document}
   \pagestyle{empty}
   \input{sections/en/title}
   \input{sections/en/sysadmin_summary}
   \input{sections/en/sysadmin_experience}
   \input{sections/en/skills}
   \input{sections/en/education}
   \end{document}
   ```

4. **Add to Makefile:**
   ```makefile
   SYSADMIN_EN_PDF=sysadmin_en_CA.pdf
   $(SYSADMIN_EN_PDF): sysadmin_en_CA.tex $(PREAMBLE) $(EN_SECTIONS)
       latexmk -pdf sysadmin_en_CA.tex
   ```

5. **Build:**
   ```bash
   make sysadmin_en_CA.pdf
   ```

## Adding New Jobs

### Add New Job to DevOps CV

1. **Create job file:**
   ```tex
   % sections/en/jobs/acme_cloud_engineer.tex
   \begin{joblong}{Cloud Engineer}{\href{https://acme.com}{ACME Corp}}{Jan 2025 - Present}
   \item Major accomplishment
   \item Another accomplishment
   \end{joblong}
   ```

2. **Add to experience section:**
   ```tex
   % sections/en/devops_experience.tex
   \section{Work Experience}
   \input{sections/en/jobs/acme_cloud_engineer}      % ADD THIS
   \input{sections/en/jobs/cleo_devops_developer}
   \input{sections/en/jobs/ads_devops_engineer}
   \input{sections/en/jobs/ovh_sysadmin}
   ```

3. **Do the same for French** in `sections/fr/jobs/` and `sections/fr/devops_experience.tex`

4. **Build:**
   ```bash
   make
   ```

## Available Make Targets

| Target | Description |
|--------|-------------|
| `make` | Build all versions (en, fr, default) |
| `make en` | Build English version only |
| `make fr` | Build French version only |
| `make set-en` | Set English as default and build |
| `make set-fr` | Set French as default and build |
| `make clean` | Remove build artifacts |
| `make distclean` | Remove all generated files |
| `make help` | Show help message |

## Workflow Examples

### Include/Exclude Jobs Easily
```bash
# Edit experience section to include Télébec
vim sections/en/devops_experience.tex
# Uncomment: \input{sections/en/jobs/telebec_tech}

vim sections/fr/devops_experience.tex
# Uncomment: \input{sections/fr/jobs/telebec_tech}

# Build
make en fr
```

### Create Multiple CV Variants for Job Search
```bash
# DevOps-focused (3 jobs)
vim sections/en/devops_experience.tex
# Include: cleo, ads, ovh

# Sysadmin-focused (2 jobs)
vim sections/en/sysadmin_experience.tex
# Include: ovh, telebec

# Build both
make devops_en_CA.pdf sysadmin_en_CA.pdf
```

## Tips

- **Keep jobs focused** - One job = one file, makes it easy to reuse
- **Use consistent naming** - `cleo_devops_developer.tex`, `ads_devops_engineer.tex`, etc.
- **Archive old jobs** - Comment them out instead of deleting, bring back anytime
- **Test both languages** - Build `make en` and `make fr` after changes
- **Version control** - Track all `.tex` files, ignore generated PDFs and artifacts

## Example `.gitignore`
```
*.pdf
*.aux
*.log
*.fdb_latexmk
*.fls
*.out
*.bcf
*.run.xml
*.blg
*.toc
*~
```
