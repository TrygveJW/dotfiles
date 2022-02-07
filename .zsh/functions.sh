


function bb (){
cat <<-END

-- nav --
<alt>f          Forward one word
<alt>b          Back one word

-- delete --
<ctrl>u         Clear to begining of line
<ctrl>k         Clear to end of line

<ctrl>b         Delete one word backwards

-- misc --
<ctrl>l         Clear screen
<ctrl>d         Exit shell

-- help categories--
bbd             dev commands

END
}


function bbd (){
cat <<-END

-- python --
pyenv           init or join venv in current dir
pipreq i|d      install| dump requierments


-- docker --
dkrsh P1        starts a shell session in the container P1 

-- docker-compose --
dkrcup          docker compose up with build
dkrdwn          docker compose down
dkrlog          docker compose log follow

-- ide --
jbintel         starts inellij detached
jbpycha         starts pycharm detached

END
}


function pargrep (){
    if [[ "$1" == "" ]]; then
        echo "Usage: pargrep  PATTERN [FILE]..."
        echo
        echo "prints the paragraph containing pattern"
        echo
    else
        awk 'BEGIN{RS=ORS="\n\n";FS=OFS="\n"}/'$1'/'
    fi



}


function compress () {
    tar cfv "${1}.tar.bz2" --use-compress-prog=pbzip2 $1

#    if [[ -f "$1" ]]; then
#        echo "q"
#    elif [[ -d "$1" ]]; then 
#        echo ""
#    fi

    #case "$1" in 
     #   (zip)
    return 0
}


# https://xgarrido.github.io/zsh-utilities/zsh-utilities-functions.html
function extract ()
{
    local remove_archive
    local file_name
    local extract_dir

    if [[ "$1" == "" ]]; then
        echo "Usage: extract [-option] [file ...]"
        echo
        echo "Options:"
        echo "    -r, --remove : Remove archive."
        echo
    fi

    remove_archive=1
    if [[ "$1" == "-r" ]] || [[ "$1" == "--remove" ]]; then
        remove_archive=0
        shift
    fi

    while [ -n "$1" ]; do
        if [[ ! -f "$1" ]]; then
            echo "'$1' is not a valid file"
            shift
            continue
        fi

        success=0
        file_name="$( basename "$1" )"
        extract_dir="$( echo "$file_name" | sed "s/\.${1##*.}//g" )"
        case "$1" in
            (*.tar.gz|*.tgz) tar xvzf "$1" ;;
            (*.tar.bz2|*.tbz|*.tbz2) tar xvjf "$1" ;;
            (*.tar.xz|*.txz) tar --xz --help &> /dev/null \
                && tar --xz -xvf "$1" \
                || xzcat "$1" | tar xvf - ;;
            (*.tar.zma|*.tlz) tar --lzma --help &> /dev/null \
                && tar --lzma -xvf "$1" \
                || lzcat "$1" | tar xvf - ;;
            (*.tar) tar xvf "$1" ;;
            (*.gz) gunzip "$1" ;;
            #(*.bz2) bunzip2 "$1" ;;
            (*.bz2) pbzip2 -d "$1" ;;
            (*.xz) unxz "$1" ;;
            (*.lzma) unlzma "$1" ;;
            (*.Z) uncompress "$1" ;;
            (*.zip) unzip "$1" -d $extract_dir ;;
            (*.rar) unrar e -ad "$1" ;;
            (*.7z) 7za x "$1" ;;
            (*.deb)
                mkdir -p "$extract_dir/control"
                mkdir -p "$extract_dir/data"
                cd "$extract_dir"; ar vx "../${1}" > /dev/null
                cd control; tar xzvf ../control.tar.gz
                cd ../data; tar xzvf ../data.tar.gz
                cd ..; rm *.tar.gz debian-binary
                cd ..
                ;;
            (*)
                echo "'$1' cannot be extracted" 1>&2
                success=1
                ;;
        esac

        (( success = $success > 0 ? $success : $? ))
        (( $success == 0 )) && (( $remove_archive == 0 )) && rm "$1"
        shift
    done
    return 0
}

