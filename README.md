# Home
Quickly set up a command line environment for long-term use in any bare metal machine.

The installation script will install some simplistic configurations of:
- `oh-my-zsh` with [a custom theme](https://github.com/KevinRSX/home/blob/master/.oh-my-zsh/kevin.zsh-theme)
- Vim
- Tmux


## Install
1. Run the installation script. Answer `Y` to all prompts. Log out of the shell when first dropped into Zsh.
```
git clone https://github.com/KevinRSX/home && cd home && ./install.sh
``` 
2. Log out of the shell and log back in again.
3. Enter Vim and `:PlugInstall`
4. Enter Tmux and `<C-b> I`


## WIP:
- [ ] Proper Neovim support (The script installs Neovim by default, but too many things still require the user to manually set up right now.)
