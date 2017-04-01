#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
PS1='\[\033[31m\]\h\[\033[34m\]@\u:\[\033[0;32m\]\w\[\033[33m\]>>> \[\033[0m\]' 
export GTK_IM_MODULE=fcitx
export QT_IM_MODLUE=fcitx
export XMODIFIERS="@im=fcitx"
alias vi='vim'
eval $(dircolors -b $HOME/.dircolors)
