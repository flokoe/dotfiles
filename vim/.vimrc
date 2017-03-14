" This is the .vimrc of Florian Köhler
" https://github.com/flokoe/dotfiles

""""""""""""""""""""""
" GENERAL
""""""""""""""""""""""

" disables compatibility to vi as well required by vundle
set nocompatible

" loads plugins from vundle
source ~/.vim/plugins.vim

" enables syntax highlighting
syntax enable

" underlines the currently active line
" so you dont loose orientation in long lines
set cursorline

" search down into subfolders
" provides tab-completion for file search
set path+=**

" displays all matching files when tab completing
set wildmenu

" highlights search results in text
set hlsearch

" specifies which color scheme should be used
colorscheme desert


""""""""""""""""""""""
" LIGHTLINE SETTINGS
""""""""""""""""""""""

set laststatus=2