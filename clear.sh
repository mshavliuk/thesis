#!/usr/bin/env sh

input="$1"
# validate input
if [ -z "$input" ]; then
    echo "Usage: clear.sh <input.tex>"
    exit 1
fi
# check existence of input file
if [ ! -f "$input" ]; then
    echo "File not found: $input"
    exit 1
fi
base_name=$(basename $input .tex)
echo "Clearing auxiliary files for $base_name"
rm -rf ./compile
find . -type f -name "*.aux" -delete
rm -f $base_name.{bbl,glg,glo,gls,ist,upa,upb,xmpdata,log,out,blg,toc,run.xml,fls,bcf,fdb_latexmk,glsdefs,loc,locn,locs} pdfa.xmpi
