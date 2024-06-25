#!/usr/bin/env sh

if [ "$1" = "--fast" ]; then
    mkdir -p compile
    pdflatex -output-directory=compile "\\gdef\\draftmode{1} \\input{main.tex}" main.tex
    mv compile/main.pdf main.pdf
else
    latexmk -c main.tex
    rm -f main.bbl main.glg main.glo main.gls main.ist main.upa main.upb main.xmpdata pdfa.xmpi

    lacheck main.tex
    latexmk -pdf -shell-escape -f main.tex
    latexmk -c main.tex
    rm -f main.bbl main.glg main.glo main.gls main.ist main.upa main.upb main.xmpdata pdfa.xmpi
    verapdf -f 3b --format text main.pdf
fi

open -a Preview main.pdf
