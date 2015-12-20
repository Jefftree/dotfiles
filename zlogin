# Execute code that does not affect the current session in the background.

{
  # Compile the completion dump to increase startup speed.
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

# Moose inspirational message of the day
#if (( $+commands[fortune] )); then
  #if [[ -t 0 || -t 1 ]]; then
    #fortune -s | cowsay -f moose | lolcat
    #print
  #fi
#fi
