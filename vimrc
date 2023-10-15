set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'tmux-plugins/vim-tmux'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'benmills/vimux'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
call vundle#end()
filetype plugin indent on

set tabstop=4
set shiftwidth=4
set expandtab
set number
set mouse=a
let g:airline_powerline_fonts=1
set laststatus=2
set autoindent
set ruler

syntax enable
set background=dark
set t_Co=256
colorscheme solarized

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


if has('gui_running')
    set guioptions-=T  " no toolbar
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 12
endif

if has("gui_macvim")
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h14 
    set guioptions-=T
    set lines=43
    set columns=80
endif

