#!/bin/bash

# Miscellaneous stuff
echo "export LC_ALL=en_US.UTF-8" >> ~/.bash_profile
echo "export LANG=en_US.UTF-8" >> ~/.bash_profile
# Restoring Safari Extensions
cp -r Safari/Extensions ~/Library/Safari/

# Installing Homebrew and packages - the most important step
printf "Proceed to install Homebrew? "
read ans
if [[ $ans =~ ^[Yy]$ ]]; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	if [[ $? -eq 0 ]]; then
		echo "Homebrew installed successfully"
	else
		echo "An error occurred, exiting the script"
		exit
	fi
fi

echo "Installing the following packages (non-cask) :-"
echo "= = = wget = = ="
brew install wget
echo "= = = fish = = ="
brew install fish
echo "= = = git = = ="
brew install git

# Setting up global .gitignore"
echo ".DS_Store" >> ~/.gitignore

echo "= = = gcc = = ="
brew install gcc
echo "= = = go = = ="
brew install go

# Setting up go
mkdir ~/go
mkdir ~/go/src
mkdir ~/go/bin
echo "export GOPATH=/Users/$USER/go" >> ~/.bash_profile
echo "export GOBIN=/Users/$USER/go/bin" >> ~/.bash_profile
echo "export PATH=$GOBIN:$PATH" >> ~/.bash_profile

echo "= = = python3 = = ="
brew install python3
echo "= = = neovim = = ="
brew install neovim
echo "= = = node = = ="
brew install node
echo "= = = rust = = ="
brew install rust

# Setting up rust
echo "export PATH=/Users/$USER/.cargo/bin:$PATH" >> ~/.bash_profile

echo "= = = speedtest-cli = = ="
brew install speedtest-cli
echo "= = = zookeeper = = ="
brew install zookeeper
echo "= = = emacs = = ="
brew install emacs
echo "= = = blueutil = = ="
brew install blueutil

echo "Installing the following packages (cask-specific) :-"
echo "= = = java = = ="
brew cask install java
echo "= = = osxfuse = = ="
brew cask install osxfuse
echo "= = = sublime-text = = ="
brew cask install sublime-text

# Setting up sublime text (hopefully this works)
mv SublimeText/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
# Restart Sublime Text and install Package Control first

echo "= = = vlc = = ="
brew cask install vlc
echo "= = = wireshark = = ="
brew cask install wireshark
echo "= = = iterm2 = = ="
brew cask install iterm2
echo "= = = spotify = = ="
brew cask install spotify
echo "= = = qbittorrent = = ="
brew cask install qbittorrent
echo "= = = impactor = = ="
brew cask install impactor
echo "= = = etcher = = ="
brew cask install etcher

echo "Stuff left to do :- "
echo "1. Set iTerm as default terminal"
echo "2. Change to Dark OS X mode"
echo "3. Set fish as default shell with vim bindings (optional)"
echo "4. Open SublimeText, install PackageControl, and see whether everything works correctly"
echo "DONE"
