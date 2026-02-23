.PHONY: all clean watch

# latexmk configuration
LATEXMK := latexmk
LATEXMK_FLAGS := -xelatex -interaction=nonstopmode -synctex=1

# Source and output files
TEX_SOURCES := main.tex consent_form.tex participant_information_sheet.tex \
               project_description.tex recruitment_resources.tex sample_questions.tex
PDF_OUTPUTS := $(TEX_SOURCES:.tex=.pdf)

# Default target
all: $(PDF_OUTPUTS)

# Build each PDF from its corresponding TEX file
%.pdf: %.tex
	$(LATEXMK) $(LATEXMK_FLAGS) $<

# Clean up build artifacts (keep PDFs)
clean:
	$(LATEXMK) -c

# Clean everything including PDFs
distclean:
	$(LATEXMK) -C

# Watch mode for continuous compilation
watch:
	$(LATEXMK) $(LATEXMK_FLAGS) -pvc main.tex
