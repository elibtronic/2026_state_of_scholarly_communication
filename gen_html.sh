#!/bin/bash
echo Generating HTML
pandoc -s -c sosp_style.css -f markdown-implicit_figures -o index.html README.md

sed -i '' 's/<title>README<\/title>/<title>2026 State of Scholarly Publishing<\/title>/g' index.html

