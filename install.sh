#!/bin/bash
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# We build our own tmux and neovim version and use our own binaries
export PATH=$PATH:$HOME/bin

install_omz() {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

install_omz_plugin() {
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
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

install_tpm() {
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

if test -f "~/.vimrc"; then
  cp $HOME/.vimrc $HOME/.vimrc.bck
fi

if test -f "~/.tmux.conf"; then
  cp $HOME/.tmux.conf $HOME/.tmux.conf.bck
fi


echo ">>>>>>>>Installing Oh My Zsh<<<<<<<<"
install_omz
cp .zshrc $HOME/.zshrc
cp .oh-my-zsh/kevin.zsh-theme $HOME/.oh-my-zsh/themes/
# install_omz_plugin

echo ">>>>>>>>Installing TMUX<<<<<<<<"
# install_tmux
# install_tpm
cp .tmux.conf $HOME/.tmux.conf


echo ">>>>>>>>Installing vim<<<<<<<<"
cp .vimrc $HOME/.vimrc
