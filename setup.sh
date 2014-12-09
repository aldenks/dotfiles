#!/usr/bin/env bash
# Set up a new OSX Mac
set -e

# Keep-alive: update existing `sudo` time stamp until finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# symlink dotfiles into home directory
./ln_dotfiles.sh

# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install caskroom/cask/brew-cask

brew cask install google-chrome
brew cask install firefox
brew cask install iterm2
brew cask install dropbox
brew cask install java
brew cask install charles
brew cask install xquartz

brew install fish
brew install vim
brew install git
brew install tree
brew install rbenv
brew install mysql
brew install maven
brew install httpie
brew install the_silver_searcher
brew install leiningen
brew install node
brew install virtualenv
sudo easy_install pip

defaults write com.apple.Safari HomePage -string "about:blank"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.dock expose-animation-duration -float 0.17
defaults write NSGlobalDomain NSWindowResizeTime -float 0.2s
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write -g ApplePressAndHoldEnabled -bool false
# annoying sounds begone
sudo nvram SystemAudioVolume=" "
defaults write "com.apple.systemsound" "com.apple.sound.uiaudio.enabled" -int 0
defaults write -g "com.apple.sound.beep.feedback" -int 0
