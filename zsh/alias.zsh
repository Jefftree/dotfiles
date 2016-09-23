# Git
alias gs='git status'
alias gst='git stash'
alias gsp='git stash pop'
alias gd='git diff'
alias gds='git diff --staged'
alias gpl='git pull'
alias gps='git push'
alias ga='git add -A'
alias gc='git commit -am'
alias gcm='git commit -m'

alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gll='git log'

alias pipi='pip3 install --user'

# Tmux
alias ta='tmux attach'
alias tad='tmux attach -d'
alias tat='tmux attach -t'
alias tm='tmux list-sessions'

alias m='make'
alias mc='make clean'

alias vi=vim

alias l='git ls-files'

alias ll='ls -alGh'

alias pyenv='source bin/activate'

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    alias ls='ls -G --color'
else
    alias ls='ls -G'
fi

alias pce='sudo shutdown -t 0'

alias rm='nocorrect rm'

alias ts='testSuite'

alias yolovim='vim -N -u NONE'

alias myip="curl http://myip.dnsomatic.com && echo ''"

alias aria='aria2c'
alias baka='baka-mplayer'

alias 'cd..'='cd ..'

alias Syu='yaourt -Syu'

# Execute last command as root
alias 'pls'='sudo $(history | tail -n 1 | sed -e "s/^[ ]*[0-9]*[ ]*//g")'

alias 'vev'='source bin/activate'

alias 'ag'='ag --path-to-agignore ~/.dotfiles/agignore'
