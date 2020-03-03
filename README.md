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
    - editing mode: vi with corresponding .inputrc
    - mostly aliases
    - custom prompt

- Consistent colorscheme settings across terminal-emulator and vim:
    - [Dracula Theme](https://draculatheme.com)
---
## Installation
To use this dotfiles repository simply clone it into your home directory with:  
```
$ git clone https://github.com/butkej/dotfiles.git
```

Afterwards, simply change into the dotfiles directory, make the script executable and run it:  
```
$ cd ~/dotfiles
$ chmod +x install.sh
$ ./install.sh
```

On the first startup of vim you will encouter errors as the plugin manager installs first itself and then downloads and installs the plugins. Simply quit out and start it again after the downloads finished and it should work completly.  

