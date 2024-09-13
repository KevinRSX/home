#!/bin/bash
GREEN='\033[0;32m'
NC='\033[0m' # No Color

mkdir -p $HOME/bin

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

install_vim() {
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

install_nvim() {
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
  chmod u+x nvim.appimage
  mv nvim.appimage $HOME/bin/nvim
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
}

backup() {
  if test -f "~/.vimrc"; then
    cp $HOME/.vimrc $HOME/.vimrc.bck
  fi

  if test -f "~/.tmux.conf"; then
    cp $HOME/.tmux.conf $HOME/.tmux.conf.bck
  fi
}



echo ">>>>>>>>Installing Oh My Zsh<<<<<<<<"
install_omz
cp .zshrc $HOME/.zshrc
cp .oh-my-zsh/kevin.zsh-theme $HOME/.oh-my-zsh/themes/
install_omz_plugin


echo ">>>>>>>>Installing TMUX<<<<<<<<"
# install_tmux
install_tpm
cp .tmux.conf $HOME/.tmux.conf


echo ">>>>>>>>Installing vim<<<<<<<<"
install_vim
cp .vimrc $HOME/.vimrc
echo "Press :PlugInstall in vim to activate the plug-ins"

echo ">>>>>>>>Installing nvim<<<<<<<<"
mkdir -p $HOME/.config
cp -r nvim $HOME/.config
install_nvim

