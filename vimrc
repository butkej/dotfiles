"color scheme (terminal)
set t_Co=256
set background=dark

"general setup
set nocompatible "dont try to be vi compatible

set encoding=utf-8

syntax on "enable syntax highlighting

set visualbell "blink cursor on error instead of beeping

set tabstop=4 "number of visual spaces per tab

set softtabstop=4 " number of spaces in tab when editing

set expandtab "tabs ARE 4 spaces

set number "show line numbering

set showcmd "show last command in bottom bar

set cursorline "highlights current line cursor is on

set clipboard=unnamedplus "to copy to system clipboard "+y

set wildmenu "autocomplete for command menu

set showmatch "highlights matching [{()}]

set incsearch "search as chars are entered

set hlsearch "highlights search results

filetype indent on "filetype detection

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

"Plugin manager vim-plug
"github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

Plug 'dracula/vim' "dracula colorscheme 

call plug#end()
