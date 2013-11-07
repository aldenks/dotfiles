function g --description 'Alias g to `git`, or `git status` if no arguments are passed'
  if count $argv > /dev/null
    git $argv
  else
    git status
  end
end
