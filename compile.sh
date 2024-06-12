#!/usr/bin/env sh

rm -rf compile
mkdir -p compile

if [ "$1" = "--fast" ]; then
    pdflatex -output-directory=compile main.tex
else
    latexmk -pdf -outdir=compile main.tex
fi

open -a Preview compile/main.pdf
