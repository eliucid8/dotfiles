#!/bin/sh

# symlink entire tmux folder into config
ln -sr tmux ~/.config/tmux

git submodule add https://github.com/tmux-plugins/tpm tmux/plugins/tpm
# submodule update is called at end of file
