export ZSH="/Users/anask/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias gs="git stage ."
alias gc="git commit -m"
alias gco="git checkout"
alias gcob="git checkout -b"
alias push="git push"
alias pull="git pull"
alias clone="git clone"

function deployPush {
	branch=$(git branch --show-current)
	git push origin $branch && git push aws $branch
}

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PATH=$HOME/go/bin:$PATH
[[ /opt/homebrew/bin/kubectl ]] && source <(kubectl completion zsh)

alias brew-x86="arch -x86_64 /usr/local/bin/brew"
