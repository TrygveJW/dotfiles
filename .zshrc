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

# unalias run-help
autoload run-help

#http://zsh.sourceforge.net/Doc/Release/Completion-System.html

# ALIASESSJAVA_HOME='/home/trygve/bin/jdk-14.0.1'

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

# ============================================
#                   completion
# ============================================


zcompile_if_newer(){
    #      -s   file   : if the file exists and is greater than zero
    # file -nt  fileb  : if file is newer then fileb
    if [[ -s ${1} && (! -s ${1}.zwc || ${1} -nt ${1}.zwc ) ]]; then
        zcompile "$1"
    fi
}
# setopt extended_glob
add_comp_dir(){
    if [[ -d ${1} ]]; then
        for f in ${1}/^(*.zwc)(.); do
            zcompile_if_newer $f
        done
    fi
}

comp_dir="$HOME/.zsh/completion"

# add completions
if [ -d $comp_dir ] ; then
    add_comp_dir $comp_dir
    fpath+=$comp_dir
fi


autoload -Uz compinit


# Run the comp init 
# Using the previous sessions compiled completion
#
# -D  = no dump file
# -C  = no chek for new completion functions 
# compinit -d ~/.zcompdump
# compinit -D




# 60 * 60 * 24 = 86400
# -le : less then
# remember [ is alias for test withc has a man page
# if [ `stat -L --format %Y $HOME/.zsh_compdump` -le $((`date +%s` - 86400)) ]; then    
    # compinit -d "$HOME/.zsh_compdump"  
# else
# fi
compinit -d "$HOME/.zsh_compdump"  

# https://zsh.sourceforge.io/Doc/Release/Completion-System.html#Use-of-compinit


#
# Bash completions does only work if bashcompinit is NOT called
#





# zprof
