#!/bin/bash

# install prereqs
sudo apt-get install ripgrep fdfind

# pinned to 0.11.5
sudo wget -O nvim -P /usr/bin/ https://github.com/neovim/neovim/releases/download/v0.11.5/nvim-linux-x86_64.appimage

git submodule update --init --recursive

ln -sr ../kickstart-modular.nvim/ ~/.config/nvim

