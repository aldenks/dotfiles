#!/usr/bin/env bash
# symlink dotfiles into home directory
set -e

cd ~
for f in $(find /Users/`whoami`/Dropbox/Code/dotfiles -maxdepth 1 -type f); do
  if [[ $f != *ln_dotfiles* ]]; then
    ln -s $f
  fi
done

# fish config directory
ln -s /Users/`whoami`/Dropbox/Code/dotfiles/.config
