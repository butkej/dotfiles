# Joshua Butke's .bashrc
########################
# if not running interactively, do not do anything
[ -z "$PS1" ] && return

#Prompt Customization
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]\[\033[01;34m\]:\w\$\[\033[00m\] '


#ALIASES

# general
alias grep="grep --color=auto"
alias la="ls -lhpa --color=auto"
alias ll="ls -lhpt --color=auto"
alias b="cd .."
alias q="exit"
alias v="vim"
alias dotfiles="cd ~/dotfiles"
alias push="git push origin master"

# tmux
alias t='tmux attach -t NERV || tmux new -s NERV' # Attaches tmux to the last session; creates a new session if none exists.

# shell history
export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTCONTROL=ignoredups # do not store duplicate commands
shopt -s histappend # do not overwrite history after each session
export HISTIGNORE="&:[ ]*:exit:ls:la:ll:bg:fg:history" # Don't record some commands
export HISTTIMEFORMAT='%F %T ' # Useful timestamp format

shopt -s autocd # prepends cd intelligently

# work specific (mostly leibniz desktop computer)
alias bphtunnel='ssh -p 2233 -Y -L 3333:leibniz.prodi.rub.de:22 butjos@turing.prodi.rub.de'

alias asuka='source activate asuka'
alias rei='source activate rei'
alias misato='source activate misato'
alias impact='source deactivate'
alias note="jupyter notebook"

alias shredder='ssh gpu-imaging1.prodi.rub.de'
alias splinter='ssh gpu-imaging2.prodi.rub.de'
alias virchow='ssh virchow.prodi.rub.de'
alias ehrlich='ssh ehrlich.prodi.rub.de'

alias master="cd /bph/puredata1/bioinfdata/user/butjos/master/"
alias fuer_arne="cd /bph/puredata1/bioinfdata/user/arnrau/Daten/NN_FTIR_Data/fuer_arne/"
alias work="cd /bph/puredata1/bioinfdata/user/butjos/work/"
alias samir="cd /bph/puredata1/bioinfdata/user/arnrau/Daten/CARS_UrineBladderCells_Project/first_data_snapshot_090119/analysed_data/"

########################
# added by Anaconda3 installer
export PATH="/opt/anaconda/bin:$PATH"  # commented out by conda initialize
# see block in >>> <<< below

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/opt/anaconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
#        . "/opt/anaconda/etc/profile.d/conda.sh"
#    else
#        export PATH="/opt/anaconda/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

########################

