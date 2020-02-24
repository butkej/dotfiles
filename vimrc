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
Plug 'christoomey/vim-tmux-navigator' "tmux integration https://github.com/christoomey/vim-tmux-navigator
Plug 'davidhalter/jedi-vim', { 'for': 'python' } "autocompletion system with Ctrl+Space

call plug#end() "end of plugin manager

"general setup
filetype plugin indent on "filetype/plugin/indent detection

set encoding=utf-8

set autoread "auto read a file again if it is changed from elsewhere

set nobackup "Disable backup files

set t_Co=256

colorscheme dracula

syntax enable "enable syntax highlighting

set history=1000 "larger vim history

set so=8 "centers the cursor when scrolling vertically

set visualbell "blink cursor on error instead of beeping

set shiftwidth=4 "also tabs are 4 spaces

set tabstop=4 "number of visual spaces per tab

set softtabstop=4 "number of spaces when pressing tab

set expandtab "tabs ARE 4 spaces

set number "show line numbering

set showcmd "show last command in bottom bar

set cursorline "highlights current line cursor is on

set ruler "always show cursor position

set wrap linebreak "one line is still one line, but vim displays on multiple lines

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

"File explorer related settings (netrw)
let g:netrw_liststyle = 3 "show as a tree stucture
let g:netrw_browse_split = 4 "opens the chosen file in the previous window
let g:netrw_winsize = 20 "file browser is 20% of window

"use the spacebar to toggle fold
nnoremap <space> za 

"Remap Escape to exit INSERT mode of vim
inoremap jk <Esc>

"configure paste mode to toggle on F2
set pastetoggle=<F2>

"map typing 'run' to clear screen and run the written python script
nnoremap run <Esc>:w<CR>:!clear;python %<CR>

"Basic bracket pair completion
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>

"disable arrow keys in vim in all modes (evil, but trains a lot)
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

"move between splits with CTRL + HJKL
nnoremap <C-J> <C-W><C-J> 
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Configure lightline statusbar
set laststatus=2

set noshowmode "lightline already shows vim's mode

let g:lightline = {
    \ 'colorscheme': 'darcula',
    \ }

"END OF FILE
