#!/bin/sh

xcode-select --install
sudo xcodebuild -license

# Install Homebrew popular OS X package manager
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Setup Homebrew
brew tap Homebrew/bundle
brew bundle

# Pull dotfiles
vcsh clone git@github.com:pftg/dotfiles.git

echo "Please install Sunrise Calendar from:"
open "https://itunes.apple.com/us/app/sunrise-calendar/id886106985?ls=1&mt=12"

# Setup ZSH
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Setup Log rotation
ln -sf `realpath ./etc/newsyslog.d/io.pftg.dev.conf` /etc/newsyslog.d/io.pftg.dev.conf

# SSD tricks
sh osx-noatime.sh
sh osx-ram-disk-for-tmp.sh


# Xcode


