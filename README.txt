Package manager: vim-plug
-------------------------
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


Advanced grepping: Ack & Ag
---------------------------
https://beyondgrep.com/install/

Local:
brew install ack
brew install the_silver_searcher

Ubuntu remote, otherwise follow official instructions:
(>19.10)
sudo apt-get install ack
(<=19.10)
sudo apt-get install ack-grep
sudo apt-get install silversearcher-ag

ctag
----
sudo apt-get install ctags
cd /path/to/source
ctags -R

