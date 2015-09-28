LS_COLORS=$LS_COLORS:'di=1;32:' ; export LS_COLORS
alias ls='ls --color -lph'
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;33m\]\w\[\e[m\] $(__git_ps1 "(%s)") $(date) \n\[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

# CD Alias
alias cd..='cd ../'                         # Go back 1 directory level 
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias ~="cd ~"                              # ~:            Go Home

clear

## Dev
export NODE_ENV=redis
export DEBUG=payment
