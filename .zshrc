# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
export ZSH_THEME="linuxonly"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby gem rails mysql)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
alias ll='ls -alF'
alias lla='ls -A'
alias sshfs='~/bin/sshfs-binaries/sshfs-static-leopard'
alias py="python"
alias wget='wget --no-check-certificate'
alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'

# rails
alias r="rails"
alias rr="rake routes | less"
alias rd="rails destroy"
alias rspec='rspec -c'
alias rdm='rake db:migrate'

# git
alias g="git"
alias ci="git commit"
alias cia="git commit --amend"
alias gl="git pull --rebase"
alias pus="git push"
alias c="git checkout"
alias b='git branch'
alias f='git flow'
alias ff='git flow feature'
alias ffs='git flow feature start'
alias fff='git flow feature finish'
alias fr='git flow release'
alias frs='git flow release start'
alias frf='git flow release finish'
alias gw='git wtf'
alias gc='git clone --recursive'



[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#http://stackoverflow.com/questions/257616/sudo-changes-path-why
#alias sudo='sudo env PATH=$PATH'

# show rvm prompt like "1.9.2@gemset_name"
function rvm_prompt {
    result=`rvm-prompt v g 2> /dev/null`
    if [ "$result" ] ; then
        echo "[$result]"
    fi  
}

#PS1="\$(~/.rvm/bin/rvm-prompt) $PS1"
#RPROMPT="[\$(~/.rvm/bin/rvm-prompt)]"
RPROMPT="\$(rvm_prompt)"


#for perlbrew
source ~/perl5/perlbrew/etc/bashrc  




