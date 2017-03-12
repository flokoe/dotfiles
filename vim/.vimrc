" This is the .vimrc of Florian Köhler
" https://github.com/flokoe/dotfiles


" disables compatibility to vi
set nocompatible

" enables syntax highlighting
syntax enable
filetype plugin on

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
