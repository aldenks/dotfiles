# Shell
set SHELL (which fish)

# Path
set PATH ~/.cabal/bin $PATH
set PATH /usr/local/sbin $PATH

# Editor
set -x EDITOR vim

# rbenv
set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

# brew
set PATH /usr/local/bin $PATH

# aliases
alias v vim
alias cdd 'cd ~/Dropbox/Code/'
alias cdu 'cd (git rev-parse --show-toplevel)' # cd to git repo root
