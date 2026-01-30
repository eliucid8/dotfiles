# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.

# source the rest of custom bashrc files in bashrc.d
if [ -d ~/.bashrc.d ]; then
    for file in ~/.bashrc.d/*; do
        if [ -f "$file" ]; then
            . "$file"
        fi
    done
fi

export IGNOREEOF=10

# Make an alias for invoking commands you use constantly
# alias p='python'
