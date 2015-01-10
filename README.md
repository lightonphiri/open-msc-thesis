# LaTeX Thesis Template

## About

This is the home of the source code of [Simple Digital Libraries](http://pubs.cs.uct.ac.za/archive/00000887), a manuscript submitted to the [University of Cape Town](http://www.uct.ac.za) in partial fulfillment of the requirements for the degree of Master of Science in Computer Science. This source code is released under a [Creative Commons Attribution-NonCommercial 4.0 International (CC BY-NC 4.0) License](http://creativecommons.org/licenses/by-nc/4.0).

### Dependencies

* Make
* [R](http://www.r-project.org)
* LaTeX

### LaTeX Packages

[LaTeX Packages](../master/packages.md)

## Contributing

I appreciate any and all efforts to help improve this source---I am actually in the process of refining and adapting it for my doctoral dissertation. Please note that the repository is structured as follows:

* chapterxx - main chapter directory.
* chapterxx/plots - houses all plot source and output files
* chapterxx/data - houses input data feeds for plots
* chapterxx/tables - houses tables
* chapterxx/code - houses code snippets
* chapterxxfigures - houses figures

## Building

You can build the manuscript by following the series of steps below.

### R Plots

Plots only exist in Evaluation chapter (chapter07/plots); so issue commands below. Note that this might take a bit of time... ~7min on an Intel CORE i3, dual core with 4GM RAM.

```shell
cd chapter07/plots
for plot in plot*Rnw; do R CMD Sweave $plot; done
```

### Glosarry

`makeindex -s phiri-thesis.ist -t phiri-thesis.glg -o phiri-thesis.gls phiri-thesis.glo`

### Indicies

Issue command below; the resulting index look and feel styling is defined in *.ist file

`makeindex -s phiri-thesis-idx.ist phiri-thesis.idx`

### Compiling TeX source

Unfortunately, pdflatex will NOT work since manuscript is integrated with PSTricks---all block diagrams were exported as PGF Macros using LaTeXDraw

In addition, you might have to run latex twice---before and after running biber

```shell
latex phiri-thesis.tex
biber phiri-thesis
latex phiri-thesis.tex
dvipdf phiri-thesis.dvi
dvips -P pdf G0 -t a4 phiri-thesis.dvi
ps2pdf phiri-thesis.ps
```