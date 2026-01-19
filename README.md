# CV - Modular LaTeX Setup

Simple modular CV system with separate English and French versions.

## Building

```bash
make           # Build all versions
make en        # Build English only  
make fr        # Build French only
make clean     # Remove build artifacts
```

## Structure

- `sections/preamble.tex` - Common LaTeX setup
- `sections/en/` - English sections
- `sections/fr/` - French sections  
- `devops_en_CA.tex` - English CV
- `devops_fr_CA.tex` - French CV

Each job is in its own file under `sections/[lang]/jobs/` and can be included or commented out in the experience section.

## Adding Jobs

Create a new file in `sections/en/jobs/` and `sections/fr/jobs/`, then add to the corresponding `devops_experience.tex`:

```tex
\input{sections/en/jobs/your_new_job}
```

Rebuild with `make en` (and `make fr` for French).
