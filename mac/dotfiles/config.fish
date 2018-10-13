fish_vi_key_bindings

alias gs="git stage ."
alias gc="git commit -m"
alias push="git push origin master"
alias commitC="git rev-list --count --all"
alias pull="git pull --rebase"
alias v="nvim"
export GOPATH="/Users/$USER/go"
export GOBIN="/Users/$USER/go/bin"
set PATH $GOBIN $PATH

function showip
	ifconfig | grep "inet.*broadcast"
end

function wifi
	networksetup -setairportpower en1 on
	networksetup -setairportnetwork en1 $argv
end

function wifoff
	networksetup -setairportpower en1 off
end

function sshon
	sudo systemsetup -setremotelogin on
	echo "ssh on for user $USER"
end

function sshoff
	sudo systemsetup -setremotelogin off
	echo "ssh off for user $USER"
end
