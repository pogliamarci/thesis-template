main := thesis

latex := xelatex
bibtex := bibtex

content := $(wildcard chapters/*.tex)
content += $(wildcard frontmatter/*.tex)
content += $(wildcard backmatter/*.tex)
content += $(wildcard backmatter/*.bib)
content += $(wildcard appendices/*.tex)

styles := $(wildcard ./*.sty)

listings := $(wildcard listings/*.c)

backup := $(addsuffix .bak, $(chapters))
backup += $(addsuffix .bak, $(frontmatter))
backup += $(addsuffix .bak, $(appendices))

figures := $(wildcard figures/*.pdf)
figures += $(wildcard figures/*.png)
figures += $(wildcard figures/*.tex)

.PHONY: all clean distclean

AWK=gawk

all: $(main).pdf

$(main).pdf: $(main).tex $(content) $(figures) $(listings) $(styles) preamble.tex
	$(AWK) -f sort-abbreviations.awk backmatter/abbreviations.tex > abbreviations-sorted.tex
	rm -f $(backup)
	${latex} $(main).tex
	${bibtex} -terse $(main).aux
	${latex} $(main).tex
	max_print_line=2048 ${latex} $(main).tex | grep '^[^()]'

clean:
	rm -f $(backup)
	rm -f $(main).aux $(main).bbl $(main).blg $(main).dvi $(main).log $(main).out $(main).ps $(main).xmpdata
	rm -f abbreviations-sorted.tex

distclean: clean
	rm -f $(main).pdf
