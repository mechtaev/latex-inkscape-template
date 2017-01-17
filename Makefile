SRC:=report.tex
PICS:=$(wildcard *.svg)

all: $(SRC) $(PICS:%.svg=%.in)
	pdflatex $(SRC)
	bibtex $(SRC:%.tex=%.aux)
	pdflatex $(SRC)
	pdflatex $(SRC)
	@echo '******** Did you spell-check the report? ********'

%.in: %.svg
	inkscape -D -z --file=$< --export-pdf=$(patsubst %.svg,%.pdf,$<) --export-latex
	mv $(patsubst %.svg,%.pdf_tex,$<) $@

clean:
	rm -f *.in
	rm -f *.log
	rm -f *.aux
	rm -f *.nav
	rm -f *.out
	rm -f *.snm
	rm -f *.toc
	rm -f *.bbl
	rm -f *.blg

