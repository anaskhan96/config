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
echo "= = = fish = = ="
brew install fish

# Setting up fish
cp dotfiles/config.fish ~/.config/fish/
curl -L https://get.oh-my.fish | fish
echo "Setting fish as default shell"
sudo bash -c "echo /usr/local/bin/fish >> /etc/shells"
chsh -s /usr/local/bin/fish

echo "= = = git = = ="
brew install git

# Setting up global .gitignore"
echo ".DS_Store" >> ~/.gitignore
git config --global user.name "Anas Khan"
git config --global user.email "anas.khan96@outlook.com"

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

# Setting up neovim
cp dotfiles/.vimrc ~/.config/nvim/init.vim

echo "= = = node = = ="
brew install node
echo "= = = zookeeper = = ="
brew install zookeeper
echo "= = = nginx = = ="
brew install nginx
ehco "= = = noti = = ="
brew install noti

echo "Installing the following packages (cask-specific) :-"
echo "= = = java = = ="
brew cask install java
echo "= = = sublime-text = = ="
brew cask install sublime-text

# Setting up sublime text (hopefully this works)
cp SublimeText/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
# Restart Sublime Text and install Package Control first

echo "= = = vlc = = ="
brew cask install vlc
echo "= = = wireshark = = ="
brew cask install wireshark
echo "= = = iterm2 = = ="
brew cask install iterm2
echo "= = = qbittorrent = = ="
brew cask install qbittorrent
echo "= = = postman = = ="
brew cask install postman
echo "= = = libreoffice = = ="
brew cask install libreoffice

# Set up tiling window manager
brew tap crisidev/homebrew-chunkwm
echo "= = = chunkwm = = ="
brew install --HEAD --with-tmp-logging chunkwm
echo "= = = skhd = = ="
brew install --HEAD --with-logging koekeishiya/formulae/skhd
# Copying the rc files
cp dotfiles/.chunkwmrc ~/
cp dotfiles/.skhdrc ~/
# Starting the services
brew services start chunkwm
brew services start skhd

echo "Stuff left to do :- "
echo "1. Set iTerm2 as default terminal"
echo "2. Change to Dark OS X mode"
echo "DONE"
