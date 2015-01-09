# Make file to facilitate generation of final .pdf output file

phiri-thesis.pdf : phiri-thesis.dvi
	dvipdf phiri-thesis.dvi

phiri-thesis.dvi : phiri-thesis.tex
	latex phiri-thesis.tex

phiri-thesis.tex : phiri-thesis.bib
	latex phiri-thesis.tex
	bibtex phiri-thesis
	latex phiri-thesis.tex
