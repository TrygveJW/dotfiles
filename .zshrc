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
alias lg='ls -alF | grep -i'
alias surf='surf -d'
alias hh='history | grep -i'


# COMPLETE
autoload -Uz compinit
compinit


zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

export PATH="/usr/local/cuda-9.0/bin:/home/trygve/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/trygve/.dotnet/tools:/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin:/home/trygve/.vimpkg/bin"
