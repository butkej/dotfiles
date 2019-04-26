# .bashrc
# Kommentare fangen mit einem Hash an.

#Prompt Customization
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]\[\033[01;34m\]:\w\$\[\033[00m\] '


#ALIASES

# general
alias grep="grep --color=auto"
alias la="ls -lhpa --color=auto"
alias ll="ls -lhpt --color=auto"
alias b="cd .."
# work specific
alias asuka='source activate asuka'
alias rei='source activate rei'
alias impact='source deactivate'
alias note="jupyter notebook"

alias master="cd /bph/puredata1/bioinfdata/user/butjos/master/"
alias fuer_arne="cd /bph/puredata1/bioinfdata/user/arnrau/Daten/NN_FTIR_Data/fuer_arne/"
alias work="cd /bph/puredata1/bioinfdata/user/butjos/work/"
alias samir="cd /bph/puredata1/bioinfdata/user/arnrau/Daten/CARS_UrineBladderCells_Project/first_data_snapshot_090119/analysed_data/"

# added by Anaconda3 installer
export PATH="/opt/anaconda/bin:$PATH"
