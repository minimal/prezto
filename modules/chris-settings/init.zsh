
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
    # export GOROOT=/usr/local/Cellar/go/1.0.3/
    # export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages
    # export PATH=/usr/local/tranquil/bin:$PATH
    # export PATH="$HOME/Library/Haskell/bin:$PATH"
    function grep-port {
        lsof -n -i4TCP:$1 | grep LISTEN
    }
else
    function grep-port {
        netstat -pntl | grep $1
    }
fi



autoload -U +X bashcompinit && bashcompinit
export PATH="$HOME/.local/bin:$PATH"
eval "$(stack --bash-completion-script "$(which stack)")"

# Source module files.
source "${0:h}/alias.zsh"
source "${0:h}/zbell.zsh"

# uncomment to reactivate
# #virtualenv setup
export WORKON_HOME="$HOME/Envs"
source /usr/local/bin/virtualenvwrapper.sh
# Disable the virtualenv prompt.
VIRTUAL_ENV_DISABLE_PROMPT=1


# fzf
if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
fi
# Use ~~ as the trigger sequence instead of the default **
# export FZF_COMPLETION_TRIGGER='~~'

# Options to fzf command
# export FZF_COMPLETION_OPTS='+c -x'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}
