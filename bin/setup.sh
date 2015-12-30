#TODO: Setup vagrant dev-box to run this provision script
sudo apt-get install aptitude

# Nvidia Drivers
sudo add-apt-repository ppa:ubuntu-x-swat/x-updates
sudo apt-get update
sudo apt-get install nvidia-current
sudo apt-get upgrade

sudo aptitude full-upgrade -y

# This will enable your Ubuntu to play popular file formats like mp3, avi, flash videos etc.
sudo apt-get install ubuntu-restricted-extras
#TODO: Install vlc, microsoft fonts and codecs
sudo apt-get install vlc

# Preload monitor applications you run, and by analyzing this data, predicts what applications you might run, and fetches those binaries and their dependencies into memory for faster startup times.
sudo apt-get install preload

#TODO: update java installation
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java7-installer

# Install HipChat
#sudo su
#echo "deb http://downloads.hipchat.com/linux/apt stable main" > \
#  /etc/apt/sources.list.d/atlassian-hipchat.list
#wget -O - https://www.hipchat.com/keys/hipchat-linux.key | apt-key add -
#apt-get update
#apt-get install hipchat

#sudo echo "deb http://downloads.hipchat.com/linux/apt stable main" > /etc/apt/sources.list.d/atlassian-hipchat.list
#sudo apt-get update
#sudo apt-get install hipchat

sudo echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update
sudo apt-get install google-chrome

sudo echo "deb http://repo.wuala.com stable main" > /etc/apt/sources.list.d/wuala.list
sudo apt-get update
sudo apt-get install wuala

# Useful CPU/Memory load indicator applet that will reside in your top panel.
#sudo add-apt-repository ppa:indicator-multiload/stable-daily
#sudo apt-get update
#sudo apt-get install indicator-multiload


# Install fast launcher
sudo apt-get install synapse

# Development Workshop
# ====================

# ZSH
sudo apt-get install autoconf bison build-essential libssl-dev libyaml-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev sqlite3 libsqlite3-dev
sudo apt-get install zsh git-core curl vim libcurl4-openssl-dev libcurl3-dev redis-server libxml2-dev libxslt1-dev git zsh libssl-dev zlib1g-dev libreadline-dev libyaml-dev memcached

curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

sudo chsh -s /bin/zsh pftg
#TODO: install my changed them for oh-my-zsh

# Setup SCM: Git

# RVM
echo "todo: install rvm, skype, vim-tiny,janus vim plugin, google-chrome"
echo progress-bar >> ~/.curlrc

# Install rubys
# Install base gems
echo "todo: rvm install 2.0.0"
curl -L https://get.rvm.io | sh
#source
#rvm install 2.1.0
#rvm use 2.1.0 --default
#rvm install 2.0.0
#rvm install 1.9.3

# Add build dependencies for some gems

# Add PostgreSQL
echo "todo: Install postgresql"

echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" | sudo tee -a /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo aptitude install postgresql-9.4 postgresql-9.4-contrib libpq-dev postgresql-server-dev-9.4
sudo -u postgres createuser pftg -s

echo 'Install mysql'
sudo aptitude install  libmysqlclient-dev


# Add WM
sudo aptitude install awesome cinnamon

# Screenshot tool Shutter
sudo aptitude install shutter

# Clenaup
# =======
sudo aptitude full-upgrade -y
sudo apt-get autoremove
sudo apt-get clean

# Setup Git Config
#[user]
#	name = Paul Nikitochkin
#	email = paul.nikitochkin@gmail.com
#[push]
#	default = current
git config --global push.default current

# Install Hub http://hub.github.com/
# Install Instapusher

#TODO: Install https://github.com/freshshell/fresh to manage dotfiles
#TODO: create dotfiles repository with my .dotfiles and links to other dotfiles which will be installed and used by me
#TODO: setup substring history search like in Fish
#TODO: setup light vim profile with plugins for editing simple system files
#TODO: setup gvim profile for development of ruby on rails projects
#TODO: setup git aliases to get changes from remote, create branches, rebasing with squashing and fixing, pushing changes
#TODO: setup github aliases to create new PR to master branch and to other's branches
#TODO: create github project for home machine provisioning: Ubuntu and OS X
#TODO: setup backup/restore script for critical files
#TODO: setup keyboard mappings to use the same hotkeys on OS X and Ubuntu to manage windows and editors
#TODO: setup rbenv, remote transmission, bittorrent-sync, virtualbox, vmware, rsync folder and linking folders, synergy and setup it
#TODO: setup dropbox, skype and other accounts
#TODO: install node.js 
#TODO: intsall my_hsows, jruby
#TODO: setup transamissions remote, setup as default app to track magnet links http://askubuntu.com/questions/122930/how-can-i-make-firefox-open-magnet-links-in-transmission
#TODO: https://sites.google.com/site/easylinuxtipsproject/ssd#TOC-Avoid-exaggerated-measures
#TODO: install github/hub https://github.com/github/hub
#TODO: heroku toolbelt: https://toolbelt.heroku.com/debian
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

#TODO: Install ngrok: https://ngrok.com/
#TODO: Install libcurl3-dev
#TODO: Install rubymine
#TODO: Setup inotify settings: http://confluence.jetbrains.com/display/IDEADEV/Inotify+Watches+Limit
#TODO: Install phantomjs

# RBenv
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
exec $SHELL

# Install the ruby-build plugin for easy building of rubies.
mkdir -p ~/.rbenv/plugins
cd !$
git clone git://github.com/sstephenson/ruby-build.git

rbenv install 2.1.2
rbenv install 1.9.3
rbenv install jruby-1.7.9
rbenv rehash
echo "Done."
