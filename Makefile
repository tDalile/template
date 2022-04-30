.PHONY: newNote

ROOT_DIR_MD=$(shell basename template-markdown)
ROOT_DIR_TEX=$(shell basename template-latex)

WORK_DIR_NOTES=notes
WORK_DIR_TEX=tex

test:

note.new:
	@mkdir -p notes
	@$(ROOT_DIR_MD)/bin/create-note
