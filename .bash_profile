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
alias cdu='cd $(git rev-parse --show-toplevel)' # cd to git repo root
alias ssht='ssh asamps01@homework.cs.tufts.edu'
alias sshtx='ssh -X asamps01@homework.cs.tufts.edu'
alias sshcluster='ssh -X asamps01@cluster6.uit.tufts.edu'
alias sftpt='sftp asamps01@linux.cs.tufts.edu'
alias cdl='cd ~-'
alias rmt='rm *~'
alias djrs='python manage.py runserver'
function mkcd { mkdir $1; cd $1; }

# takes in new repo's name as argument
# ex: $ git-create tufts-hackathon
# via marshall moutenot
function git-create () {
  user=$(git config --get github.user)
  git init
  touch README.md
  curl -u "${user}" https://api.github.com/user/repos -d '{"name":"'${1}'"}' > /dev/null
  git remote add origin git@github.com:${user}/${1}.git
  git add .
  git commit -am 'first commit'
  git push -u origin master
}
