# A few aliases

# ls aliases
if [ "$kernel" = 'Linux' ]; then
    # alias ls='ls --color=auto'
elif [ "$kernel" = 'Darwin' ]; then
    # alias ls='gls --color=auto'
    # alias du='gdu'
    alias sort='gsort'
fi

# alias ll='ls -l'
# alias la='ls -A'
# alias l='ls -CF'
alias lh='ls -lh'
alias ldot='ll -d .*'
alias ltr='ll -tr'
#alias ls='ls -G' # osx/bsd

if (cmd_exists k); then
    alias kk='k -h'
fi

if (cmd_exists fzf); then
	if (cmd_exists fd); then
		alias cdfzf='cd $(fd -td . ~ | fzf)'
	fi
fi


if (cmd_exists exa); then
    alias ll='exa -l --colour-scale'
    alias ltr='ll -lrsold'
	alias lla='ll -a'
	alias llg='ll --git'
# ls++ http://github.com/trapd00r/ls--
else
    if (cmd_exists ls++); then
	if [ "$kernel" = 'Darwin' ]; then
            alias ll='  LC_ALL=en_US.UTF-8 LANG=en ls++ '
	else
            alias ll='ls++'
	fi
	alias lla='ll -a'
	alias llo='ll --potsf'
    fi
fi
alias rdirs='dirs -v'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias rgrep='rgrep --color=auto'

#alias ack='ack-grep'
if (cmd_exists ack); then
    alias ackpy='ack --python'
    alias p-ack="ps ax | ack"
fi

# use the fastest searcher for grepper
if (cmd_exists ag); then
    export GREPPER='ag'
    alias agpy='ag -G "\.py$"'
    alias agclj='ag -G "\.clj[sc]?$"'
    alias p-ag="ps ax | ag"

elif (cmd_exists ack); then
    export GREPPER='ack'
else
    export GREPPER='grep'
fi

# python
alias rmpyc='rm **/*pyc'
alias pyclean='rmpyc'
alias pipreqs='pip install -r requirements.txt'
alias pipwheel='pip install --use-wheel'

alias dud='du --max-depth=1 -h'
alias duds='du -h --max-depth=1 . | sort -h'

alias ltmux="if tmux has; then tmux attach; else tmux new; fi"

# more aliases
# debian/ubuntu shortcuts
if [ "$kernel" = 'Linux' ]; then
    # debian
    if (cmd_exists apt-get); then
        alias apt-install='sudo apt-get install'
        alias apt-remove='sudo apt-get remove'
    fi
    # suse
    if (cmd_exists zypper); then
        alias zinstall='sudo zypper install'
        alias zearch='zypper se'
        alias zrefresh='sudo zypper refresh'
        alias open='kde-open'
    fi
fi

alias ppjson='python -c "import json; import sys; print json.dumps(json.loads(sys.stdin.read()), indent=4)" | pygmentize -f console -l js'

alias gita="git archive --format=zip `git reflog | grep 'HEAD@{0}' | cut -d \" \" -f1 | sed 's/[.]*//g'` > archive.zip"
alias gka="gitk --all&"
# alias g="git"
alias rm-git-turds='rm **/(*.orig|*(LOCAL|BASE|REMOTE|BACKUP)*)'
function cdgroot () { cd `git root`; } # relies on a git alias `root = !pwd`

# start a Python HTTP server with webshare
alias webshare='python -m SimpleHTTPServer 8000'
alias websharecgi='python -m CGIHTTPServer 8001'

# open in running emacs from  cmdline w/o waiting
if [ "$kernel" = 'Darwin' ]; then
    alias emacsclient="/usr/local/Cellar/emacs/HEAD/bin/emacsclient"
    alias mdfindname="mdfind -name"
elif [ "$kernel" = 'Linux' ]; then
    alias emacsclient="emacsclient -s /tmp/emacs1000/server"
fi


alias e="emacsclient --no-wait"

# ruby
alias bi="bundle install --jobs 4 --binstubs .bundle/bin"
alias be="bundle exec"
