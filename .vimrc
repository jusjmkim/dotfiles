set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Opens directory structure buffer
Plugin 'https://github.com/scrooloose/nerdtree.git'
" Allows comment toggling
Plugin 'https://github.com/scrooloose/nerdcommenter.git'
" Sets up rails related shortcuts
Plugin 'git://github.com/tpope/vim-rails.git'
" Code snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
" Sets up tab completion
Plugin 'https://github.com/ervandew/supertab.git'
" Allows multiple cursors
Plugin 'https://github.com/terryma/vim-multiple-cursors.git'
" Allows rvm to work with vim
Plugin 'tpope/vim-rvm'
" Allows for easy motion
Plugin 'Lokaltog/vim-easymotion'
" Solarized Color Scheme
Plugin 'altercation/vim-colors-solarized'

call vundle#end()            " required
filetype plugin indent on    " required

" better command-line completion
set wildmenu
" autocomplete html
autocmd BufNewFile,BufRead *.html.erb set filetype=html
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" Turn syntax highlighting on
syntax enable
set fillchars=vert:\ ,fold:\
let g:solarized_termcolors=256
let g:solarized_visibility="high"
set background=dark
colorscheme solarized

" highlight searches
set hlsearch

" Keeps same indent
set autoindent

" Display cursor position
set ruler

" Set command window height to 2 lines
set cmdheight=2

" Display line numbers on left
set number

" Set tabs to 2 spaces
set shiftwidth=2
set softtabstop=2
set expandtab
set tabstop=2

" Keyboard shortcuts
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
nmap <S-J> gj
nmap <S-K> gk
nmap <S-H> g0
vmap <S-H> g0
nmap <S-L> g$
vmap <S-L> g$
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-H> <C-W><C-H>
imap jj <Esc>

" NERDtree modifications

" Open NERDtree automatically
autocmd vimenter * NERDTree
" Closes NERDtree if only buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Show dotfiles
let NERDTreeShowHidden=1
" Switch to other buffer
autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | wincmd p | endif

" NERDcommenter modifications
let mapleader=","

" easy motion
nmap <leader> <Plug>(easymotion-prefix)

" Connect yank to clipboard
set clipboard=unnamed
