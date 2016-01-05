#!/bin/sh

echo "Please install Xcode from:"
open "https://itunes.apple.com/us/app/xcode/id497799835?ls=1&mt=12"
read -p "Press enter to continue"

echo "Please install Sunrise Calendar from:"
open "https://itunes.apple.com/us/app/sunrise-calendar/id886106985?ls=1&mt=12"
read -p "Press enter to continue"

# Install Homebrew popular OS X package manager
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
ln -s "$(brew --prefix)/Library/Contributions/brew_zsh_completion.zsh" /usr/local/share/zsh/site-functions

/usr/local/bin/brew install vcsh mr

# Pull dotfiles
vcsh clone https://github.com/pftg/dotfiles.git

cd ~/.dotfiles/osx-bootstrap/

xcode-select --install
sudo xcodebuild -license

# Setup Homebrew
brew tap Homebrew/bundle
brew bundle

# Install compiled phantomjs 1.9.8
brew cask install https://raw.githubusercontent.com/caskroom/homebrew-cask/b234ca9329525eca21012c76a5bc2b69a9d15a8d/Casks/phantomjs.rb
# Install compiled phantomjs 2.0.0
brew cask install phantomjs

/usr/local/bin/brew install zsh
chsh -s /usr/local/bin/zsh pftg


# Setup ZSH
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Setup Log rotation
ln -s `realpath ./etc/newsyslog.d/io.pftg.dev.conf` /etc/newsyslog.d/io.pftg.dev.conf

# SSD tricks
source osx-noatime.sh
source osx-ram-disk-for-tmp.sh


# Setup OSX defaults

cd ~/.dotfiles/osx-bootstrap/

git clone git@github.com:pftg/mathiasbynens-dotfiles.git

cd mathiasbynens-dotfiles

source .osx


