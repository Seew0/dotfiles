#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

neofetch


alias ls='ls --color=auto'
alias rm='rm -rf'
alias install='sudo pacman -S'
alias update='sudo pacman -Syu'
alias remove='sudo pacman -R'
alias purge='sudo pacman -Rcns'
alias disco='nyancat'
alias haxxer='cmatrix'
PS1='[\u@\h \W]\$ '
