# home

This WIP repository provides a one-liner to set up the command line-based programming environment on most Linux machines, including servers, clusters, and the cloud.

In theory, this repo and the programming environment it builds should have the following properties:
- the user needs to do no more than run `./install.sh` to set up the whole environment without any error on any Linux distribution that maintains a recent LTS kernel version, and no step should require installing any dependencies using the package manager with root permission
- the environment is minimal but should include the key features of Zsh, Tmux, and Vim (or Neovim) that are commonly used by most system programmers
- the user should have the option to build the binaries from the source since some Linux distributions' package managers maintain utilities that are too old
  - in this case, the user is responsible for installing the dependencies on their own, potentially using the package manager with `sudo`
- the installed config files should be documented, especially the features of the plug-ins, so that the user will be clear on what features are supported
- the user should have the option to use Vim and not Neovim (due to the constraint of the machine or the user's personal preference), meaning that Vim configuration should be self-contained
  - to separate the two configurations, we will manually maintain both `.vimrc` and `init.vim` (i.e., not linking them with symlink or lua command)

## Current Status
### Zsh
The user must manually source the `.zshrc` file.

### Tmux
- To build Tmux from the source, many additional packages must be installed
- The user must manually perform TPM installation

### Vim
The user must manually perform a `:PlugInstall`

### Neovim
Requires a lot of packages. telescope also has many dependencies. We should possibly move Neovim out completely. Other required actions include:
- `:PlugInstall`
- `:checkhealth telescope`
