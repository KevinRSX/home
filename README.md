# vim-config
## Installation

This copies `*.rc` to `~`. You should make sure you are installing for the correct user.
```
$ chmod a+x install.sh
$ ./install.sh
```
Open vim, `:PlugInstall`. C-n to turn off NerdTree navigation.

## Acknowledgments
.vimrc
 - https://cs4118.github.io/dev-guides/kernel-workflow
 - https://vim.fandom.com/wiki/Example_vimrc

vim-plug
 - https://github.com/junegunn/vim-plug

Other plug-ins
 - See .vimrc for their GitHub repo name. I have also starred most if not all of them.

## What Next?
ctags: http://ctags.sourceforge.net/
```
$ cd /path/to/c/project/
$ ctag -R
```

tmux

I'm new to tmux as well, so probably
 - get familiar with [tmux cheatsheet](https://tmuxcheatsheet.com/)
 - have a better .tmux.conf
 - add `tmux a` or something to your .ssh/config
 - ...
