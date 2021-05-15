export JAVA_8_HOME=(/usr/libexec/java_home -v1.8)
export JAVA_11_HOME=(/usr/libexec/java_home -v11)

alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java11='export JAVA_HOME=$JAVA_11_HOME'

function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

fish_default_key_bindings

# Fish shell

egrep "^export " ~/.bash_profile | while read e
	set var (echo $e | sed -E "s/^export ([A-Z_]+)=(.*)\$/\1/")
	set value (echo $e | sed -E "s/^export ([A-Z_]+)=(.*)\$/\2/")

	# remove surrounding quotes if existing
	set value (echo $value | sed -E "s/^\"(.*)\"\$/\1/")

	if test $var = "PATH"
		# replace ":" by spaces. this is how PATH looks for Fish
		set value (echo $value | sed -E "s/:/ /g")

		# use eval because we need to expand the value
		eval set -xg $var $value

		continue
	end

	# evaluate variables. we can use eval because we most likely just used "$var"
	set value (eval echo $value)

	#echo "set -xg '$var' '$value' (via '$e')"
	set -xg $var $value
end

alias gs="git stage ."
alias gc="git commit -m"
alias gco="git checkout"
alias gcob="git checkout -b"
alias push="git push origin (git branch | grep \* | cut -d ' ' -f2)"
alias commitC="git rev-list --count --all"
alias pull="git pull origin (git branch | grep \* | cut -d ' ' -f2) --rebase"
alias clone="git clone"
alias lg="lazygit"
alias v="vim"
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

function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/anask/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/anask/Downloads/google-cloud-sdk/path.fish.inc'; end

nvm use default
