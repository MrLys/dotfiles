#!/usr/bin/env bash
mv ~/.config/nvim ~/.config/nvim.bak
mkdir -p ~/.config/nvim
cp -r lazyvim/* ~/.config/nvim

mkdir -p ~/.local/scripts
cp tmux-sessionizer ~/.local/scripts
