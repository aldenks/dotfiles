alias v vim
function g
  if count $argv == 0
    git status
  else
    git $argv
  end
end

alias cdd cd ~/Dropbox/Code/
alias cdu cd $(git rev-parse --show-toplevel) # cd to git repo root
alias cdl cd ~-
function mkcd
  mkdir $argv[0]; cd $argv[0]
end
