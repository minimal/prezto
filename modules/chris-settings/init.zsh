
kernel=`uname`

setopt interactivecomments
REPORTTIME=10  # if cmd takes longer than n seconds report the time

# # awesome!! e.g. $ git <up-arrow> => $ git log
# bindkey "^[[A" history-beginning-search-backward
# bindkey "^[[B" history-beginning-search-forward
# # some keyboards use this:
# bindkey "^[OA" history-beginning-search-backward
# bindkey "^[OB" history-beginning-search-forward


# functions
function cmd_exists() {
    command -v "$1" >/dev/null 2>&1;
}

function h () {
    cd ~/$1
}

function c () {
    cd ~/code/$1;
}

if [ "$kernel" = 'Darwin' ]; then
    export GOROOT=/usr/local/Cellar/go/1.0.3/
    export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages
    export PATH=/usr/local/tranquil/bin:$PATH

    function grep-port {
        lsof -n -i4TCP:$1 | grep LISTEN
    }
else
    function grep-port {
        netstat -pntl | grep $1
    }
fi


# Source module files.
source "${0:h}/alias.zsh"
