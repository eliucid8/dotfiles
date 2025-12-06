#!/bin/bash

# ensure path is added
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

# prefer zoxide on PATH, otherwise try explicit locations
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init bash)"
elif [ -x "$HOME/.local/bin/zoxide" ]; then
    eval "$($HOME/.local/bin/zoxide init bash)"
elif [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
    command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init bash)"
fi
