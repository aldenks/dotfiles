# PATH
PATH=$HOME/local/install:$PATH # manually installed things go here
PATH=/usr/local/share/npm/bin:$PATH # npm

export NODE_PATH="/usr/local/lib/node"

# Ruby Version Manager
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# PROMPT
PS1="\w$ " # set prompt to be current working dir, relative to ~

# ALIASES
alias m='mate'
alias v='mvim'
alias cdd='cd ~/Dropbox/Code/'
alias cdh='cd ~/Dropbox/Code/django/hullabaloo/'
alias cdxim='cdd; cd rails/xim/'
alias ssht='ssh asamps01@linux.cs.tufts.edu'
alias sshtx='ssh -X asamps01@linux.cs.tufts.edu'
alias sftpt='sftp asamps01@linux.cs.tufts.edu'
alias cdl='cd ~-'
alias rmt='rm *~'
alias djrs='python manage.py runserver'
function mkcd { mkdir $1; cd $1; }


