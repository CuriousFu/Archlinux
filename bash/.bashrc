#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias mv='mv -i'
alias rm='rm -i'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

find_git_branch () {
    local dir=. head
    until [ "$dir" -ef / ]; do
        if [ -f "$dir/.git/HEAD" ]; then
            local head=$(< "$dir/.git/HEAD")
            if [[ $head = ref:\ refs/heads/* ]]; then
                git_branch="[${head#*/*/}]"
            elif [[ $head != '' ]]; then
                git_branch="[(detached)]"
            else
                git_branch="[(unknow)]"
            fi
            return
        fi
        dir="../$dir"
    done
    git_branch=''
}

PROMPT_COMMAND="find_git_branch; $PROMPT_COMMAND"
#PS1='[\u@\h \W]\$ '
PS1='\[\033[31m\]\h\[\033[34m\]@\u:\[\033[0;33m\]\w\[\033[36;22m\]$git_branch\[\033[33m\]\n\033[7C~>>> \[\033[0m\]' 
#PS1='\[\033[31m\]\h\[\033[34m\]@\u:\[\033[0;32m\]\w\[\033[33m\]>>> \[\033[0m\]' 
#	if [[ ${EUID} == 0 ]] ; then

#PS1='\[\033[31m\]\h\[\033[34m\]@\u:\[\033[0;32m\]\w\[\033[33m\]>>> \[\033[0m\]' 
#    else
#PS1='\[\033[31m\]\h\[\033[34m\]@\u:\[\033[0;32m\]\w\[\033[33m\]\n\033[7C~>>> \[\033[0m\]' 
#	fi
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
#fcitx configure.
export GTK_IM_MODULE=fcitx
export QT_IM_MODLUE=fcitx
export XMODIFIERS="@im=fcitx"
alias vi='vim'

#clorful ls
eval $(dircolors -b $HOME/.dircolors)

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#my personal vimrc for i3wm
alias uvi='/usr/bin/vim -u ~/.config/i3/.vimrc'

# Avoid garbled characters when unzip files ziped on Windows. Depend on package unzip-iconv
# Change the charset as needed
export UNZIP='-O gb18030'
export ZIPINFO="-O gb18030"
#python虚拟工具的配置
export VIRTUALENV_USE_DISTRIBUTE=1        #  总是使用 pip/distribute
#创建目录用来存放和管理虚拟环境,创建文件夹用来存放项目工程代码
#where .virtualenvs is the directory where the venvs would be placed.
#workspace is the directory where the code will reside. 

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/workspace 
if [ -e /usr/includelocal/bin/virtualenvwrapper.sh ];then
   source /usr/local/bin/virtualenvwrapper.sh
else if [ -e /usr/bin/virtualenvwrapper.sh ];then
         source /usr/bin/virtualenvwrapper.sh
    fi
fi
export EDITOR=vim
#避如果没有启动虚拟环境，系统也安装了pip工具，那么套件将被安装在系统环境中，为了避免发生此事，可以在~/.bashrc文件中加上此句
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
