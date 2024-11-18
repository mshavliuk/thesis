#!/usr/bin/env sh

echo "Compiling $2"

input="$1"
flag="$2"

# validate input
if [ -z "$input" ]; then
    echo "Usage: compile.sh <input.tex> [--fast]"
    exit 1
fi
# check existence of input file
if [ ! -f "$input" ]; then
    echo "File not found: $input"
    exit 1
fi

# cut file extension, add .pdf
output=$(basename $input .tex).pdf

if [ "$flag" = "--fast" ]; then
  echo "fast compile"
#    mkdir -p compile
    pdflatex "\\gdef\\draftmode{1} \\input{$input}" $input
#    mv compile/main.pdf main.pdf
    open -a Preview $output
else
    lacheck $input
    latexmk -c $input
    latexmk -pdf -shell-escape -f $input
    latexmk -c $input
    open -a Preview $output
    verapdf -f 3b --format text $output
fi

./clear.sh $input
