#!/bin/bash

for file in $(find . -type f ! -name "*.sh" -printf "%T@ %p\n" | sort -n | awk '{print $2}'); do
    echo $file
    echo "-----------------------------------"
    head -n 5 $file
    echo "..................................."
    tail -n 5 $file
    echo "-----------------------------------"
    echo ""
done | less
