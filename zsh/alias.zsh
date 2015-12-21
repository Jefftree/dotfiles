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


