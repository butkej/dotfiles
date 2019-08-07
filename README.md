# dotfiles
This repository contains my personal bash and vim configurations which I use at personal and work computers running Linux-based operating systems.  
More configurations might come soon TM...  

## Specifications
- Simple vimrc configuration
    - disables arrow keys
    - sensible defaults similar to tpope [vim-sensible plugin](https://github.com/tpope/vim-sensible)
    - binds `ESC` to `jk`
    - uses vim-plug as plugin manager (bootstraps automatic self-installation)
    - automatically loads missing plugins and installs them on first startup of vim

- Plugins:
    - lightline as a lightweight statusbar
    - vim-tmux-navigator
    - dracula colortheme
    - jedi-vim python autocompletion

- Simple bashrc configuration
    - mostly aliases
    - custom prompt

- Consistent colorscheme settings across terminal-emulator and vim:
    - [Dracula Theme](https://draculatheme.com)
---
## Installation
To use this dotfiles repository simply clone it with:  
```
$ git clone https://github.com/butkej/dotfiles.git
```

Afterwards, simply change into the dotfiles directory, make the script executable and run it:  
```
$ cd ~/dotfiles
$ chmod +x install.sh
$ ./install.sh
```
