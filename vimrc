"Joshua Butke's .vimrc
""""""""""""""""""""""
set nocompatible "dont try to be vi compatible

"Plugin manager vim-plug
"github.com/junegunn/vim-plug
"""""""""""""""""""""""""""""
"automatically bootstrap install the plugin manager if it is not installed

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

"Plugin directory and starting vim-plug
call plug#begin('~/.vim/plugged')

"Automatically install missing plugins on startup
if !empty(filter(copy(g:plugs), '!isdirectoy(v:val.dir)'))
    autocmd VimEnter * PlugInstall | q
endif

"List of plugins
Plug 'dracula/vim', { 'as': 'dracula' } "dracula colorscheme 
Plug 'itchyny/lightline.vim' "lightweight statusbar

call plug#end() "end of plugin manager

"general setup
filetype plugin indent on "filetype/plugin/indent detection

set encoding=utf-8

set t_Co=256

set background=dark

syntax enable "enable syntax highlighting

set visualbell "blink cursor on error instead of beeping

set tabstop=4 "number of visual spaces per tab

set softtabstop=4 " number of spaces in tab when editing

set expandtab "tabs ARE 4 spaces

set number "show line numbering

set showcmd "show last command in bottom bar

set cursorline "highlights current line cursor is on

set ruler

set wildmenu "autocomplete for command menu

set showmatch "highlights matching [{()}]

set incsearch "search as chars are entered

set hlsearch "highlights search results

set ignorecase "makes search case-insensitive

set autoindent "enable autoindent

"Folding related settings
set foldenable "enable folding

set foldlevelstart=10 "open most folds by default

set foldmethod=indent "fold based on indent level

set foldlevel=99

nnoremap <space> za "use the spacebar to toggle fold

"Remap Escape to exit INSERT mode of vim
inoremap jk <Esc>

"Basic bracket pair completion
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>

"disable arrow keys in vim (evil, but trains me to become better)
map <up> <nop>
map <left> <nop>
map <down> <nop>
map <right> <nop>

imap <up> <nop>
imap <left> <nop>
imap <down> <nop>
imap <right> <nop>

"Split config
set splitbelow
set splitright

"Configure lightline statusbar
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'darcula',
    \ }
