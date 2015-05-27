# pip and virtualenvwrapper
# export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
# export VIRTUALENV_DISTRIBUTE=true
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
PATH="$HOME/.opam/system/bin:$HOME/perl5/bin:.bundle/bin:$HOME/.rbenv/shims:$HOME/Library/Haskell/bin:/usr/local/tranquil/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/python:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/bin"; export PATH;

# Add GHC 7.8.3 to the PATH, via http://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.8.3.app"
if [ -d "$GHC_DOT_APP" ]; then
    export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

if [[ -s "${ZDOTDIR:-$HOME}/.secrets" ]]; then
  source "${ZDOTDIR:-$HOME}/.secrets"
fi

. /Users/chrismcdevitt/.nix-profile/etc/profile.d/nix.sh
export NIX_PATH=nixpkgs=~/nixpkgs

export PIP_REQUIRE_VIRTUALENV=true
