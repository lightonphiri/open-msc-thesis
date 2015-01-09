% Author: Lighton Phiri <http://lightonphiri.org>
% Date: March 3, 2013
% 

### Generating plots ###
- Plots only exist in Evaluation chapter; so issue commands below. Note that this might take quite a bit of time... ~7min on 4GM; Intel CORE i3, dual core.

cd chapter07/plots
for plot in plot*Rnw; do R CMD Sweave $plot; done

### Generating Bibliography ###
- You might have to run latex twice --before& after running bibtex

latex phiri-thesis.tex
bibtex phiri-thesis.aux
latex phiri-thesis.tex

### Generating Glosarry ###
- Issue command below
makeindex -s phiri-thesis.ist -t phiri-thesis.glg -o phiri-thesis.gls phiri-thesis.glo

### Generating Index ###
- Issue command below... resulting index look& feel styling is defined in *.ist file
makeindex -s phiri-thesis-idx.ist phiri-thesis.idx


### dvi file ###
- Unfortunately, pdflatex will NOT work since manuscript is integrated with PSTricks... all block diagrams were created using PSTricks

latex phiri-thesis.tex

### pdf file ###

dvipdf phiri-thesis.dvi

### UCT requires that a4 be used---dvips can be use to explicitly make use of a4
dvips -Ppdf -t a4 phiri-thesis.dvi


************ Sanity Checks **********

### Spell checks ###
- Ensure aspell is installed; then issue command below... I current cd into each directory containing TeX files and issue command below
for file in *tex; do aspell -c $file --mode=tex; done
for file in *tex; do aspell -c $file --mode=tex --lang=en_GB --add-tex-command="citep op"; done

### Disable automatic landscape rotation of figures ###
- For some strange reason, some pages with figures are automatically landscaped...
- http://tug.org/pipermail/texhax/2011-March/017019.html
dvipdf -dAutoRotatePages=/None phiri-thesis.dvi

### Convert *.png et al. to *.eps
convert WWW-survey-research-link-masked.png WWW-survey-research-link-masked.ps
ps2eps -f --fixps convert WWW-survey-research-link-masked.ps
