#!/bin/sh
GREEN='\033[0;32m'
NC='\033[0m' # No Color


if test -f "~/.vimrc"; then
	cp ~/.vimrc ~/.vimrc.back
fi

if test -f "~/.tmux.conf"; then
	cp ~/.tmux.conf ~/.tmux.conf.back
fi


echo -e $GREEN"Installing Oh My Zsh"$NC
scripts/install_omz.sh


