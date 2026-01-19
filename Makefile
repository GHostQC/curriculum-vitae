# CV Build System - Modular English (Canada) and French (Canada)
# 
# This Makefile orchestrates building multiple CV versions from reusable section libraries.
# 
# Structure:
#   sections/preamble.tex          - Common LaTeX setup and environments
#   sections/en/                   - English section libraries
#   sections/fr/                   - French section libraries
#   devops_en_CA.tex               - English DevOps CV (composes en sections)
#   devops_fr_CA.tex               - French DevOps CV (composes fr sections)
#   devops.tex                     - Default version (synced from en or fr)

EN_SOURCE=devops_en_CA.tex
FR_SOURCE=devops_fr_CA.tex
DEFAULT=devops.tex
EN_PDF=devops_en_CA.pdf
FR_PDF=devops_fr_CA.pdf
DEFAULT_PDF=devops.pdf

# Sections directory
SECTIONS_DIR=sections
PREAMBLE=$(SECTIONS_DIR)/preamble.tex
EN_SECTIONS=$(wildcard $(SECTIONS_DIR)/en/*.tex)
FR_SECTIONS=$(wildcard $(SECTIONS_DIR)/fr/*.tex)
EN_JOBS=$(wildcard $(SECTIONS_DIR)/en/jobs/*.tex)
FR_JOBS=$(wildcard $(SECTIONS_DIR)/fr/jobs/*.tex)

# Default target - builds all versions
.PHONY: all en fr default clean distclean help

all: $(EN_PDF) $(FR_PDF)

# Build English version
en: $(EN_PDF)
	@echo "✓ Built: $(EN_PDF)"

$(EN_PDF): $(EN_SOURCE) $(PREAMBLE) $(EN_SECTIONS) $(EN_JOBS)
	latexmk -pdf $(EN_SOURCE)

# Build French version
fr: $(FR_PDF)
	@echo "✓ Built: $(FR_PDF)"

$(FR_PDF): $(FR_SOURCE) $(PREAMBLE) $(FR_SECTIONS) $(FR_JOBS)
	latexmk -pdf $(FR_SOURCE)

# Build default version
default: $(DEFAULT_PDF)
	@echo "✓ Built: $(DEFAULT_PDF)"

$(DEFAULT_PDF): $(DEFAULT) $(PREAMBLE)
	latexmk -pdf $(DEFAULT)

# Set English as default
set-en: $(EN_SOURCE)
	cp $(EN_SOURCE) $(DEFAULT)
	$(MAKE) $(DEFAULT_PDF)
	@echo "✓ Set default language to English"

# Set French as default
set-fr: $(FR_SOURCE)
	cp $(FR_SOURCE) $(DEFAULT)
	$(MAKE) $(DEFAULT_PDF)
	@echo "✓ Set default language to French"

# Clean build artifacts
clean:
	latexmk -c $(EN_SOURCE) $(FR_SOURCE) 2>/dev/null; true
	latexmk -c $(DEFAULT) 2>/dev/null; true
	rm -f *~ *.aux *.bbl *.bcf *.fdb_latexmk *.fls *.log *.out *.run.xml *.blg *.toc

# Clean all including PDFs
distclean: clean
	rm -f $(EN_PDF) $(FR_PDF) $(DEFAULT_PDF)

# Help
help:
	@echo "CV Translation Build System (Modular)"
	@echo ""
	@echo "Available targets:"
	@echo "  make              - Build all versions (en, fr, default)"
	@echo "  make en           - Build English version"
	@echo "  make fr           - Build French version"
	@echo "  make default      - Build default version"
	@echo "  make set-en       - Set English as default and build"
	@echo "  make set-fr       - Set French as default and build"
	@echo "  make clean        - Remove build artifacts"
	@echo "  make distclean    - Remove all generated files (PDFs + artifacts)"
	@echo "  make help         - Show this help message"
	@echo ""
	@echo "Directory structure:"
	@echo "  sections/"
	@echo "    preamble.tex          - Common LaTeX setup and environments"
	@echo "    en/                   - English section libraries"
	@echo "      title.tex"
	@echo "      devops_summary.tex"
	@echo "      devops_experience.tex"
	@echo "      skills.tex"
	@echo "      education.tex"
	@echo "    fr/                   - French section libraries"
	@echo "      title.tex"
	@echo "      devops_summary.tex"
	@echo "      devops_experience.tex"
	@echo "      skills.tex"
	@echo "      education.tex"
	@echo ""
	@echo "Top-level CVs (compose sections):"
	@echo "  devops_en_CA.tex"
	@echo "  devops_fr_CA.tex"
	@echo "  devops.tex (synced to en or fr)"
