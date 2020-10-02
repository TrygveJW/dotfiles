
#zmodload zsh/zprof
# ============================================
#                   options
# ============================================
#http://zsh.sourceforge.net/Guide/zshguide06.html


export JAVA_HOME='/home/trygve/Development/support_software/jdk-14.0.1'

# HISTORY
HISTSIZE=1000
SAVEHIST=10000
HISTFILE=~/.zsh_history




#http://zsh.sourceforge.net/Doc/Release/Completion-System.html

# ALIASESSJAVA_HOME='/home/trygve/bin/jdk-14.0.1'

# ============================================
#                   completion
# ============================================

fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit

for dump in ~/.zcompdump(N.mh+24); do
  compinit
done

#compinit 

#autoload -U bashcompinit
#bashcompinit

bash_source() {
  alias shopt=':'
  alias _expand=_bash_expand
  alias _complete=_bash_comp
  emulate -L sh
  setopt kshglob noshglob braceexpand

  source "$@"
}

have() {
  unset have
  (( ${+commands[$1]} )) && have=yes
}


#bash_source '/usr/share/bash-completion/bash_completion' 



# ============================================
#                   prompt
# ============================================

# PROMPT
fpath=($HOME/.zsh/prompts $fpath)
autoload -U promptinit
promptinit
prompt myadam


# ============================================
#                   Paths
# ============================================
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# add rust cargo
if [ -d "$HOME/.cargo/bin" ] ; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

# add rust cargo
if [ -d "$HOME/Development/support_software/node-v14.10.0-linux-x64/bin" ] ; then
    PATH="$HOME/Development/support_software/node-v14.10.0-linux-x64/bin:$PATH"
fi


# ============================================
#                   misc
# ============================================

# colloring man
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

# Adds the command not found install with 
source /etc/zsh_command_not_found


# ============================================
#                   options
# ============================================


# load aliases if any
if [ -f $HOME/.zsh/aliases.zsh ]; then
    source $HOME/.zsh/aliases.zsh
fi

# load functions if any
if [ -f $HOME/.zsh/functions.sh ]; then
    source $HOME/.zsh/functions.sh
fi
# load setopts if any
if [ -f $HOME/.zsh/setopt.zsh ]; then
    source $HOME/.zsh/setopt.zsh
fi

# load zsyles if any
if [ -f $HOME/.zsh/zstyle.zsh ]; then
    source $HOME/.zsh/zstyle.zsh
fi

# load keybinds if any
if [ -f $HOME/.zsh/key_bindings.zsh ]; then
    source $HOME/.zsh/key_bindings.zsh
fi

#zprof
