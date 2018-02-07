# pip and virtualenvwrapper
# export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
# export VIRTUALENV_DISTRIBUTE=true
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3

export PROJECT_HOME=~/code

# seems to break rubybuilds
# export C_INCLUDE_PATH=/usr/local/Cellar/libxml2/2.9.1/include/libxml2:$C_INCLUDE_PATH

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH=".bundle/bin:$PATH"



# OPAM configuration
. $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
CAML_LD_LIBRARY_PATH="$HOME/.opam/system/lib/stublibs:/usr/local/lib/ocaml/stublibs"; export CAML_LD_LIBRARY_PATH;
PERL5LIB="$HOME/.opam/system/lib/perl5:$HOME/perl5/lib/perl5:"; export PERL5LIB;
OCAML_TOPLEVEL_PATH="$HOME/.opam/system/lib/toplevel"; export OCAML_TOPLEVEL_PATH;
MANPATH="$HOME/.opam/system/man:"; export MANPATH;

export PATH="$HOME/.local/bin:$PATH"
export PATH=$PATH:$HOME/Downloads/confluent-4.0.0/bin/

if [[ -s "${ZDOTDIR:-$HOME}/.secrets" ]]; then
  source "${ZDOTDIR:-$HOME}/.secrets"
fi

export PIP_REQUIRE_VIRTUALENV=true
export GPG_TTY=$(tty)

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS='--preview "fzfprev {}"'

CONFLUENT_HOME=/Users/cmcdevitt/Downloads/confluent-4.0.0/
