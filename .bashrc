#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias logoutdm='light-locker-command -l'

PS1='[\u@\h \W]\$ '

# Easy access to parent working directory
alias current="cd /home/gigi/Code/Current"
alias org="cd /home/gigi/Dropbox/org"
alias booksync="rsync -rave ssh /media/Books/ gigi@45.79.86.68:~/calibre/ --delete"
alias em="emacs -nw -q"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export GEM_HOME=$HOME/.gem
export GEM_PATH=$HOME/.gem
