#!/usr/bin/env bash
mv $HOME/.config/nvim $HOME/.config/nvim.bak
mkdir -p $HOME/.config/nvim
cp -r lazyvim/* $HOME/.config/nvim
#tmux
sudo apt install tmux
# tmux plugin manager
TPMDIRECTORY="$HOME/.tmux/plugins/tpm"
if [ ! -d "$TPMDIRECTORY" ]; then
	git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
	echo "TPM installed"
else
	echo "TPM already installed"
fi
# tmux fzf
cp tmux.conf $HOME/.tmux.conf
tmux run-shell "source ~/.tmux.conf"
# tmux sessionizer
mkdir -p $HOME/.local/scripts
cp tmux-sessionizer $HOME/.local/scripts
