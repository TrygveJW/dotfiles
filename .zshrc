# setopt prompt_subst; zmodload zsh/datetime; PS4='+[$EPOCHREALTIME]%N:%i> '; set -x
# zmodload zsh/zprof
# for i in $(seq 1 10); do /usr/bin/time /bin/zsh -i -c exit; done;
# ============================================
#                   options
# ============================================
#http://zsh.sourceforge.net/Guide/zshguide06.html


export JAVA_HOME='/home/trygve/Development/support_software/jdk-15'

export CHROME_EXECUTABLE='/snap/bin/chromium'


# HISTORY
HISTSIZE=1000
SAVEHIST=10000
HISTFILE=~/.zsh_history




#http://zsh.sourceforge.net/Doc/Release/Completion-System.html

# ALIASESSJAVA_HOME='/home/trygve/bin/jdk-14.0.1'

# ============================================
#                   completion
# ============================================


# compile the completion files for faster startup
build_zsh_comp_file(){
  # Compile zcompdump, if modified, to increase startup speed.
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  #      -s   file   : if the file exists and is greater than zero
  # file -nt  fileb  : if file is newer then fileb
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
}

# &! zsh only detatchh and disown
build_zsh_comp_file &!




# reload zsh
rlzsh(){
    compinit -d 
    build_zsh_comp_file &!
}

fpath=(~/.zsh/completion $fpath)


# add completions
if [ -d "$HOME/.zsh/completion/" ] ; then
    fpath+="$HOME/.zsh/completion"
fi

autoload -Uz compinit

# 60 * 60 * 24 = 86400
# -le : less then
# remember [ is alias for test withc has a man page
if [ `stat -L --format %Y $HOME/.zcompdump` -le $((`date +%s` - 86400)) ]; then
    rlzsh
else
  compinit -C
fi


autoload -Uz bashcompinit
bashcompinit



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

# add node 
if [ -d $HOME/Development/support_software/node-*/bin ] ; then
    PATH="$(realpath $HOME/Development/support_software/node-*/bin):$PATH"
fi

# add go
if [ -d "$HOME/Development/support_software/go" ] ; then
    PATH="$HOME/Development/support_software/go/bin:$PATH"
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

# zprof
