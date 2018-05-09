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
Plugin 'scrooloose/nerdtree'
" Allows comment toggling
Plugin 'scrooloose/nerdcommenter'
" Sets up rails related shortcuts
Plugin 'tpope/vim-rails'

" Javascript Syntax
Plugin 'pangloss/vim-javascript'
" Ruby Syntax
Plugin 'vim-ruby/vim-ruby'
" OCaml Syntax
Plugin 'the-lambda-church/merlin'
" Mustache Templates
Plugin 'mustache/vim-mustache-handlebars'
" LaTex Syntax
Plugin 'lervag/vim-latex'
" Track the engine
Plugin 'SirVer/ultisnips'
" Code snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/snipmate-snippets'
" Sets up tab completion
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
" Closes quotes, parens, etc.
Plugin 'Raimondi/delimitMate'
" Allows multiple cursors
Plugin 'terryma/vim-multiple-cursors'
" Allows rvm to work with vim
Plugin 'tpope/vim-rvm'
" HTML mappings
Plugin 'tpope/vim-ragtag'
" Allows for easy motion
Plugin 'Lokaltog/vim-easymotion'
" Colored status/tabline
Plugin 'bling/vim-airline'
" Fuzzy search
Plugin 'wincent/Command-T'

call vundle#end()            " required
filetype plugin indent on    " required

" better command-line completion
set wildmenu
" autocomplete html
autocmd BufNewFile,BufRead *.html.erb set filetype=eruby.html
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" ultisnips settings
let g:UltiSnipsExpandTrigger='<tab>'
" youcompleteme settings
let g:ycm_key_list_select_completion=['<C-n>']
let g:ycm_key_list_previous_completion=['<C-p>']
" supertab settings
let g:SuperTabDefaultCompletionType='<C-Tab>'

autocmd BufEnter * lcd %:p:h

" Turn syntax highlighting on
syntax enable
set t_Co=256
colorscheme railscasts

" highlight searches
set hlsearch

" Keeps same indent
set autoindent

" Display cursor position
set ruler

" Set command window height to 2 lines
set cmdheight=2

" Show current incomplete commands
set showcmd

" Make it obvious where 80 characters is
set colorcolumn=+1

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Display line numbers on left
set number

" Set tabs to 2 spaces
set shiftwidth=2
set softtabstop=2
set expandtab
set tabstop=2

" Keyboard shortcuts
nmap <S-CR> O<Esc>
nmap <CR> o<Esc>
map j gj
noremap k gk
map <S-H> g0
map <S-L> g$
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-H> <C-W><C-H>
imap jj <Esc>
imap JJ <Esc>
nnoremap p p=`]
nnoremap ; "_d

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
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

" Set up merlin
if executable('ocamlmerlin') && has('python')
  let s:ocamlmerlin = substitute(system('opam config var share'), '\n$', '', '''') . "/ocamlmerlin"
  execute "set rtp+=".s:ocamlmerlin."/vim"
  execute "set rtp+=".s:ocamlmerlin."/vimbufsync"
endif

" fountain syntax
au BufRead,BufNewFile *.fountain setfiletype fountain

