" This is the .vimrc of Florian Köhler
" https://github.com/flokoe/dotfiles

""""""""""""""""""""""
" GENERAL
""""""""""""""""""""""

" disables compatibility to vi as well required by vundle
set nocompatible

" Disable modeline for security reasons (https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim. md)
set modelines=0
set nomodeline

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
"colorscheme gruvbox

" make tabs four spaces big
set tabstop=2 shiftwidth=2 expandtab smarttab

" Add syntax highlighting to files without proper filetype extension
au BufRead,BufNewFile *.js.dist set filetype=javascript


""""""""""""""""""""""
" LIGHTLINE SETTINGS
""""""""""""""""""""""

set laststatus=2

" set colorscheme for lightline
let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ }


""""""""""""""""""""""
" GRUVBOX SETTINGS
""""""""""""""""""""""

"set background=dark
