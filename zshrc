
export PATH=~/.dotfiles/bin:$PATH
#export PATH=~/.powerline/scripts:$PATH

export SCALA_HOME=/usr/local/bin/scala
#export PATH=$PATH:$SCALA_HOME/bin
#export PATH=$PATH:~/bin/spark-1.5.1-bin-hadoop2.6/bin
#export PATH=$PATH:~/bin/hadoop-2.6.1




# Prezto
source "$HOME/.zprezto/init.zsh"

alias gs='git status'
alias gst='git stash'
alias gsp='git stash pop'
alias gd='git diff'
alias gpl='git pull'
alias gps='git push'
alias ga='git add -A'
alias gc='git commit -am'
alias gcm='git commit -m'

alias ta='tmux attach'
alias tad='tmux attach -d'
alias tat='tmux attach -t'
alias tm='tmux list-sessions'

alias m='make'
alias mc='make clean'

alias vi=vim

alias l='git ls-files'

alias ll='ls -alGh'

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    alias ls='ls -G --color'
else
    alias ls='ls -G'
fi

alias rm='nocorrect rm'

alias ts='testSuite'

alias yolovim='vim -N -u NONE'

alias myip="curl http://myip.dnsomatic.com && echo ''"

alias aria='aria2c'
alias baka='baka-mplayer'

# Colors
export TERM=screen-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# Enable color in grep
alias grep='grep --color=auto'
export GREP_COLOR='3;33'
unset GREP_OPTIONS


HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# cd without typing cd
setopt AUTO_CD

setopt APPEND_HISTORY # Allow multiple terminal sessions to all append to one zsh command history
setopt INC_APPEND_HISTORY # Add comamnds as they are typed, don't wait until shell exit
setopt HIST_REDUCE_BLANKS # Remove extra blanks from each command line being added to history
setopt EXTENDED_HISTORY # Include more information about when the command was executed, etc