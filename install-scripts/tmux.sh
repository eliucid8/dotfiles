#!/bin/sh

# symlink entire tmux folder into config
if [[ -e "~/.config/tmux" && ! -L "~/.config/tmux" ]] {
    exit 0
}
ln -sr tmux ~/.config/tmux

git submodule add https://github.com/tmux-plugins/tpm tmux/plugins/tpm
# submodule update is called at end of file
