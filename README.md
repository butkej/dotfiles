# dotfiles
This repository contains my personal bash and vim configurations which I use at personal and work computers running Linux-based operating systems.  
More configurations might come soon TM...  

## Specifications
- Simple vimrc configuration
    - disables arrow keys
    - sensible defaults similar to tpope [vim-sensible plugin](github.com/tpope/vim-sensible)
    - binds <ESC> to <jk> 

- Simple bashrc configuration
    - mostly aliases

- Consistent colorscheme settings across terminal-emulator and vim:
    - [DRACULA](draculatheme.com)

## Installation
To use this dotfiles repository simply clone it with:  
```
git clone git://github.com/butkej/dotfiles.git
```

Afterwards, simply change into the dotfiles directory, make the script executable and run it:  
```
cd ~/dotfiles
chmod +x install.sh
./install.sh
```
