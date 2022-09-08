set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Cursor should be block instead of | at all time
" nvim only
set guicursor=n-v-c-i:block
lua require("plugin")

