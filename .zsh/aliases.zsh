# alias for the git dotfile stuff
# https://www.atlassian.com/git/tutorials/dotfiles
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias cfgu='cfg commit -a -m "updates"'


alias vim="gnome-terminal --window-with-profile=vim -- vim"


# pipe output to clipboard
alias tclp=" | xclip"


# add colors
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# ls aliases 
# -a = all includes hidden 
# -l = long format
# -F = show type endings e.g. dir/ executable*
# -h = human readable 10k 4G 
alias ll='ls -alFh'
alias lg='ls -alFh | grep -i '

alias hh='history 1 | grep -i'

# watch with collor and mark diff with interval 1
alias wa1='watch -dc -n 1'

# ============================================
#             package managing
# ============================================

# apt
alias apts='apt search'
alias aptinf='apt show'
alias apti='sudo apt install'
alias aptp='sudo apt purge'
alias aptuu='sudo apt update && sudo apt upgrade -y'

# snap
alias snaps='snap find'
alias snapinf='snap info'
alias snapi='sudo snap install'
alias snapp='sudo snap remove'
alias snapuu='sudo snap refresh'

# adds multiline for the SOA on dig
alias dig='dig +multiline'



# load and change conf
alias ezsh='vim $HOME/.zshrc'
alias szsh='source $HOME/.zshrc'

# python        
spytonenv(){
    if [[ "$1" == "" ]]; then
        dir="venv"
    else
        dir="$1"
    fi
    source "$dir"/bin/activate
}


# docker
dkr-sh(){
    docker exec $1 -it /bin/bash
}


alias dkrc-up="docker-compose up --build -V"
alias dkrc-dwn="docker-compose down"



# kubernetes

alias kk='microk8s kubectl'
alias kkga="kk get --all-namespaces"
alias kkda="kk describe --all-namespaces"
alias kkdel="kk delete --all-namespaces"


