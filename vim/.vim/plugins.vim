""""""""""""""""""""""
" VUNDLE INSTALLATION
""""""""""""""""""""""

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Install lightline
Plugin 'itchyny/lightline.vim'

call vundle#end()            " required
filetype plugin indent on    " required
