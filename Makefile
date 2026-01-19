# Build LaTeX CVs (English and French)

EN_SOURCE=devops_en_CA.tex
FR_SOURCE=devops_fr_CA.tex
DEFAULT=devops.tex
EN_PDF=devops_en_CA.pdf
FR_PDF=devops_fr_CA.pdf
DEFAULT_PDF=devops.pdf

SECTIONS_DIR=sections
PREAMBLE=$(SECTIONS_DIR)/preamble.tex
EN_SECTIONS=$(wildcard $(SECTIONS_DIR)/en/*.tex)
FR_SECTIONS=$(wildcard $(SECTIONS_DIR)/fr/*.tex)
EN_JOBS=$(wildcard $(SECTIONS_DIR)/en/jobs/*.tex)
FR_JOBS=$(wildcard $(SECTIONS_DIR)/fr/jobs/*.tex)

.PHONY: all en fr default clean distclean help

all: $(EN_PDF) $(FR_PDF)

en: $(EN_PDF)
$(EN_PDF): $(EN_SOURCE) $(PREAMBLE) $(EN_SECTIONS) $(EN_JOBS)
	latexmk -pdf $(EN_SOURCE)

fr: $(FR_PDF)
$(FR_PDF): $(FR_SOURCE) $(PREAMBLE) $(FR_SECTIONS) $(FR_JOBS)
	latexmk -pdf $(FR_SOURCE)

default: $(DEFAULT_PDF)
$(DEFAULT_PDF): $(DEFAULT) $(PREAMBLE)
	latexmk -pdf $(DEFAULT)

set-en: $(EN_SOURCE)
	cp $(EN_SOURCE) $(DEFAULT)
	$(MAKE) $(DEFAULT_PDF)

set-fr: $(FR_SOURCE)
	cp $(FR_SOURCE) $(DEFAULT)
	$(MAKE) $(DEFAULT_PDF)

clean:
	latexmk -c $(EN_SOURCE) $(FR_SOURCE) 2>/dev/null; true
	latexmk -c $(DEFAULT) 2>/dev/null; true
	rm -f *~ *.aux *.bbl *.bcf *.fdb_latexmk *.fls *.log *.out *.run.xml *.blg *.toc

distclean: clean
	rm -f $(EN_PDF) $(FR_PDF) $(DEFAULT_PDF)
