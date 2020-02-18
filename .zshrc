# PROMPT
autoload -Uz promptinit
promptinit
prompt adam1




# HISTORY
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

setopt appendhistory
setopt share_history


# ALIASESS
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias ll='ls -alF'
alias surf='surf -d'
alias hh='history | grep -i'


# COMPLETE
autoload -Uz compinit
compinit


zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
