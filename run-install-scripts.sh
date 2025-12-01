#!/bin/sh

# source all files in install-scripts
if [ -d install-scripts ]; then
    for file in install-scripts; do
        if [ -f "$file" ]; then
            . "$file"
        fi
    done
fi
