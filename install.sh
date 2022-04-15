#!/bin/bash
OS="`uname`"
installer=""
ag=""
next=":PlugInstall in vim and you are good to go!"

case $OS in
   "Linux")
      installer="sudo apt"
      ag="silversearcher-ag"
      ;;
   "Darwin")
      installer="brew"
      ag="the_silver_searcher"
      ;;
   *)
      echo "Linux and Darwin only"
      exit 1
      ;;
esac

if test -f "~/.vimrc"; then
	cp ~/.vimrc ~/.vimrc.back
fi

if test -f "~/.tmux.conf"; then
	cp ~/.tmux.conf ~/.tmux.conf.back
fi

cp ./.vimrc ~/.vimrc
cp ./.tmux.conf ~/.tmux.conf

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
$installer update
$installer install ack
$installer install $ag
$installer install ctags

GREEN='\033[0;32m'
NC='\033[0m' # No Color
echo -e $GREEN$next$NC
