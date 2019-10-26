#!/bin/bash

# Miscellaneous stuff
echo "export LC_ALL=en_US.UTF-8" >> ~/.bash_profile
echo "export LANG=en_US.UTF-8" >> ~/.bash_profile

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
echo "= = = nginx = = ="
brew install nginx
echo "= = = lazygit = = ="
brew install lazygit
echo "= = = thefuck = = ="
brew install thefuck

echo "Installing the following packages (cask-specific) :-"
echo "= = = java = = ="
brew cask install java
echo "= = = vscode = = ="
brew cask install visual-studio-code

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
echo "= = = brave = = ="
brew cask install brave-browser
echo "= = = spotify = = ="
brew cask install spotify

# Set up tiling window manager
brew tap koekeishiya/formulae
echo "= = = chunkwm = = ="
brew install chunkwm
echo "= = = skhd = = ="
brew install skhd
# Copying the rc files
cp dotfiles/.chunkwmrc ~/
cp dotfiles/.skhdrc ~/
# Starting the services
brew services start chunkwm
brew services start skhd

echo "Stuff left to do :- "
echo "1. Set iTerm2 as default terminal"
echo "DONE"
