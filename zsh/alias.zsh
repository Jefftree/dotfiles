# Git
alias gs='git status'
alias gst='git stash'
alias gsp='git stash pop'
alias gd='git diff'
alias gds='git diff --staged'
alias gpl='git pull'
alias gps='git push'
alias gfr='git fetch && git rebase'
alias gr='git rebase -i'
alias ga='git add -A'
alias gaa='git add -A'
alias gc='git commit -am'
alias gcm='git commit -m'
alias go='git checkout'
alias gob='git checkout -b'

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

if type vim8 >/dev/null; then
  alias vi='vim8'
  alias vim='vim8'
else
  alias vi='vim'
fi

#alias vi='vim -w ~/.vim/key.log'

alias l='git ls-files'

alias ll='ls -lGh'

alias 'vev'='source env/bin/activate'

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    alias ls='ls -G --color'
    alias aria='aria2c'
    alias baka='baka-mplayer'
    alias Syu='yaourt -Syu'
else
    alias ls='ls -G'
fi

alias pce='sudo shutdown -t 0'

alias rm='nocorrect rm'

alias ts='testSuite'

alias yolovim='vim -N -u NONE'

alias myip="curl http://myip.dnsomatic.com && echo ''"

alias 'cd..'='cd ..'

# Execute last command as root
alias 'pls'='sudo $(history | tail -n 1 | sed -e "s/^[ ]*[0-9]*[ ]*//g")'

alias 'ag'='ag --path-to-agignore ~/.dotfiles/agignore'

# Ya these two don't work rn...

# Remove stopped containers
alias 'docker-rmstop'='docker rm $(docker ps -a | grep Exited | awk "{print $1;}")'

# Remove untagged images
alias 'docker-clean'='docker rmi $(docker images -q --filter "dangling=true")'

#if [[ -d ~/.emacs.d ]]; then
  #alias | sed -E "s/'//g; s/^([^=]+)=(.*)$/alias \1 '\2 \$*'/g" >! ~/.emacs.d/eshell/zalias
#fi
