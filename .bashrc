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

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
alias uvi='/usr/bin/vim -u ~/.config/i3/.vimrc'


#创建目录用来存放和管理虚拟环境
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/workspace 
export VIRTUALENV_USE_DISTRIBUTE=1        #  总是使用 pip/distribute
export WORKON_HOME=$HOME/.virtualenvs       # 所有虚拟环境存储的目录
if [ -e /usr/includelocal/bin/virtualenvwrapper.sh ];then
   source /usr/local/bin/virtualenvwrapper.sh
else if [ -e /usr/bin/virtualenvwrapper.sh ];then
         source /usr/bin/virtualenvwrapper.sh
    fi
fi

#避如果没有启动虚拟环境，系统也安装了pip工具，那么套件将被安装在系统环境中，为了避免发生此事，可以在~/.bashrc文件中加上此句
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
