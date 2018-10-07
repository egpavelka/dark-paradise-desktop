#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias logoutdm='light-locker-command -l'

PS1='[\u@\h \W]\$ '

# Frequent commands
alias current="cd /home/gigi/Code/Current"
alias org="cd /media/documentos/org"
alias booksync="rsync -rave ssh /media/libros/ gigi@45.79.86.68:~/calibre/ --delete"
alias em="emacs -nw -q -l ~/.emacs.d/init_nw.el"
alias killorphans="yay -Rns $(yay -Qtdq)"
alias installedprograms="comm -23 <(yay -Qqt | sort) <(yay -Qqg base | sort)"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.gem/bin"
export GEM_HOME=$HOME/.gem
export GEM_PATH=$HOME/.gem
