# alias for the git dotfile stuff
# https://www.atlassian.com/git/tutorials/dotfiles
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias cfgu='cfg commit -S -a -m "updates"'

alias gitc='git commit -S'
alias gitcu='git commit -S -a -m "updates"'


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
alias wa1='watch -c -n 1'

# ============================================
#             package managing
# ============================================

# apt
APT_MNGR='nala'
alias apts="$APT_MNGR search"
alias aptinf="$APT_MNGR show"
alias apti="sudo $APT_MNGR install"
alias aptp="sudo $APT_MNGR purge"
alias aptuu="sudo $APT_MNGR update && sudo $APT_MNGR upgrade -y"

# snap
alias snaps='snap find'
alias snapinf='snap info'
alias snapi='sudo snap install'
alias snapp="sudo snap remove"
alias snapuu="sudo snap refresh"

# adds multiline for the SOA on dig
alias dig='dig +multiline'

# rsync for cp/mv
cpr() {
  rsync --archive -hh --partial --info=stats1,progress2 --modify-window=1 "$@"
} 
mvr() {
  rsync --archive -hh --partial --info=stats1,progress2 --modify-window=1 --remove-source-files "$@"
}

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

pyenv(){
    env_name=".py_env"
    if [[ ! -d "$PWD/$env_name" ]]; then
        echo "No env found creaing venv at $PWD/$env_name"
        python3 -m venv $env_name
    fi
    source "$PWD/$env_name/bin/activate"
}

pipreq(){
    local rtype
    local pipcmd
    local rfile

    if [[ "$1" == "dump" ]] || [[ "$1" == "d" ]]; then
        rtype="dump"
    elif [[ "$1" == "install" ]] || [[ "$1" == "i" ]]; then
        rtype="install"
    else
        echo "Usage pipreq type [REQ_FILE]"
        echo 
        echo "Installs or dumps to the REQ_FILE file in the local dir"
        echo "if no REQ_FILE is defined requirements.txt is used"
        echo 
        echo "type:"
        echo "d,  dump      dump the dependencys to the req file"
        echo "i,  instell   install the dependencys from the req file"
        return 1
    fi

    if [[ -n "$(command -v pip3)" ]]; then
        pipcmd="pip3" 
    elif [[ -n "$(command -v pip)" ]]; then
        echo "pip3 not found using pip"
        pipcmd="pip"
    else
        echo "no pip version found"
        return 1
    fi 

    shift
    if ! [[ "$1" == "" ]]; then
        rfile="$1"
    fi

    rfile="requirements.txt"


    if [[  $rtype = "dump" ]]; then
        $pipcmd freeze > $rfile
    elif [[  $rtype = "install" ]]; then
        $pipcmd install -r $rfile
    fi
}

# docker
dkrsh(){
    if [[ "$1" == "-h" ]] || [[ "$1" == "" ]]; then
        echo "Usage dkrsh [-h] CONTAINER"
        echo 
        echo "Starts a shell session in the container named CONTAINER "
        echo 
        echo "opions"
        echo "-h            shows this help"
        return 1
    fi
    docker exec -it "$1" /bin/bash
}


alias dkrcup="docker-compose up --build -V"
alias dkrcdwn="docker-compose down"
alias dkrclog="docker-compose logs -f"



# kubernetes

alias kk='microk8s kubectl'
alias kkga="kk get --all-namespaces"
alias kkda="kk describe --all-namespaces"
alias kkdel="kk delete --all-namespaces"


# jetbrains
#
# skape en bs fil med output finnut ac det kansje nokk med direct to dev/null
#
# alias jbintel="nohup intellij-idea-ultimate ./ & disown > /dev/null"
# alias jbpycha="nohup pycharm-professional ./ & disown > /dev/null"
