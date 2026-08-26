#!/bin/bash
echo Adding GA stuff

GA_SCRIPT=$(cat ga_snippet.html | sed 's/[\/&]/\\&/g')
HLN=$(awk "/<\/head>/ {print FNR}" index.html)
head -n $((--HLN)) index.html > new.html
cat  ga_snippet.html >> new.html
tail -n +$((++HLN)) index.html >> new.html
mv new.html index.html

