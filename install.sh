#!/bin/bash
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# We build our own tmux and neovim version and use our own binaries
export PATH=$PATH:$HOME/bin

install_omz() {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

install_tmux() {
  rm -rf /tmp/tmux
  git clone https://github.com/tmux/tmux /tmp/tmux
  pushd /tmp/tmux
  ./autogen.sh
  ./configure && make
  cp /tmp/tmux/tmux $HOME/bin/
  popd
}

if test -f "~/.vimrc"; then
  cp $HOME/.vimrc $HOME/.vimrc.bck
fi

if test -f "~/.tmux.conf"; then
  cp $HOME/.tmux.conf $HOME/.tmux.conf.bck
fi


echo ">>>>>>>>Installing Oh My Zsh<<<<<<<<"
install_omz

echo ">>>>>>>>Installing TMUX<<<<<<<<"
install_tmux

