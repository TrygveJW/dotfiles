# https://zsh.sourceforge.io/Doc/Release/Completion-System.html#Completion-System






zstyle ':completion:*' insert-tab false


#zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' menu select=2 interactive

zstyle ':completion:*' completer _expand _complete 

zstyle ':completion:*'  ''
#zstyle ':completion:*' menu select=long
zstyle ':completion:*' verbose true

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/completion_cache

#https://zsh.sourceforge.io/Doc/Release/Completion-Widgets.html#Completion-Matching-Control
# zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' matcher-list  \
    'b:=. b:=*' \
 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' \

# 'b:=. b:=*'
# matches words to their equvalant with a dot prefix
# e.g vim bashrc <tab> -> vim .bashrc
#
# 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 
# Makes the matching case insensititve 
#

# the default completeion stuff 
#zstyle ':completion:*' auto-description 'specify: %d'
#
#
zstyle ':completion:*' group-name ''
#zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
#zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
#zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
#zstyle ':completion:*' menu select=long
#zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl true
#zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

