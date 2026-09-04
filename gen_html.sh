#!/bin/bash
echo Generating HTML
pandoc -s -c sosp_style.css -f markdown-implicit_figures -o index.html README.md

sed -i '' 's/<title>README<\/title>/<title>2026 State of Scholarly Publishing<\/title>/g' index.html

GA_SCRIPT=$(cat ga_snippet.html | sed 's/[\/&]/\\&/g')
HLN=$(awk "/<\/head>/ {print FNR}" index.html)
head -n $((--HLN)) index.html > new.html
cat  ga_snippet.html >> new.html
tail -n +$((++HLN)) index.html >> new.html
mv new.html index.html