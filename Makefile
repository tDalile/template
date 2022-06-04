.PHONY: note.new note.pdf

ROOT_DIR_MD=$(shell basename template-markdown)
ROOT_DIR_TEX=$(shell basename template-latex)

WORK_DIR_NOTES=notes
WORK_DIR_TEX=tex

OUT_DIR_NOTES=export
OUT_DIR_TEX=export

PANDOC_FLAGS =\
	-f markdown+tex_math_single_backslash \
	-t latex \

LATEX_FLAGS =\
	-H etc/disable_float.tex

note.new:
	@$(ROOT_DIR_MD)/bin/create-note
	@cp -n -r $(ROOT_DIR_MD)/etc .
	@mv -i $(ROOT_DIR_MD)/$(WORK_DIR_NOTES)/*.md $(WORK_DIR_NOTES)

note.pdf: $(patsubst %.md,%.pdf,$(wildcard notes/*.md))

# Generalized rule: how to build a .pdf from each .md
%.pdf: %.md
	@mkdir -p $(OUT_DIR_NOTES)
	@pandoc $(PANDOC_FLAGS) $(LATEX_FLAGS) -o $@ $< -C
	@mv -i $(WORK_DIR_NOTES)/*.pdf $(OUT_DIR_NOTES)
