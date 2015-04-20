# pip and virtualenvwrapper
# export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
# export VIRTUALENV_DISTRIBUTE=true
export PROJECT_HOME=~/code
export WHEELHOUSE=~/wheelhouse
export PIP_USE_WHEEL=true
# export PIP_FIND_LINKS=$WHEELHOUSE

# seems to break rubybuilds
# export C_INCLUDE_PATH=/usr/local/Cellar/libxml2/2.9.1/include/libxml2:$C_INCLUDE_PATH

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH=".bundle/bin:$PATH"

# OPAM configuration
. /Users/chris/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
CAML_LD_LIBRARY_PATH="/Users/chris/.opam/system/lib/stublibs:/usr/local/lib/ocaml/stublibs"; export CAML_LD_LIBRARY_PATH;
PERL5LIB="/Users/chris/.opam/system/lib/perl5:/Users/chris/perl5/lib/perl5:"; export PERL5LIB;
OCAML_TOPLEVEL_PATH="/Users/chris/.opam/system/lib/toplevel"; export OCAML_TOPLEVEL_PATH;
MANPATH="/Users/chris/.opam/system/man:"; export MANPATH;
PATH="/Users/chris/.opam/system/bin:/Users/chris/perl5/bin:.bundle/bin:/Users/chris/.rbenv/shims:/Users/chris/Library/Haskell/bin:/usr/local/tranquil/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/python:/usr/bin:/bin:/usr/sbin:/sbin:/Users/chris/bin"; export PATH;

# Add GHC 7.8.3 to the PATH, via http://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.8.3.app"
if [ -d "$GHC_DOT_APP" ]; then
    export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

# fast lein http://swannodette.github.io/2014/12/22/waitin/
LEIN_FAST_TRAMPOLINE=y
export LEIN_FAST_TRAMPOLINE
# alias cljsbuild="lein trampoline cljsbuild $@"  # no worky!

function cljsbuild () {
    lein trampoline cljsbuild $@
}
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0.jdk/Contents/Home/
