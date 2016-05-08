# Path to your oh-my-zsh installation.
export ZSH=/Users/lhtan/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bullet-train"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

# User configuration

export PATH="/Users/lhtan/.gem/bin:/Users/lhtan/android-sdks/tools:/Users/lhtan/android-sdks/platform-tools:/usr/local/bin:/Users/lhtan/google-sdk/google-cloud-sdk/bin:/usr/local/autoconf/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/lhtan/android-sdks/platform-tools:/Users/lhtan/Go/bin:/usr/local/opt/go/libexec/bin:/usr/local/mongodb/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias sudo='sudo '
alias ll='ls -lhG'
alias la='ls -lhA'
alias ls='ls -G'
alias q='exit'
function filetree(){ ls -R $@  | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'; }

alias raspberry='ssh pi@192.168.12.1'
alias diff='diff -y'
eval "$(thefuck --alias)"
eval "$(thefuck --alias FUCK)"

#git command
alias gc='git commit -am'
alias gp='git push origin master'
alias gl='git log --oneline --abbrev-commit --all --graph --decorate --color'
alias gb='git branch'
alias gsl='git stash list'
alias gss='git stash save '
alias gsa='git stash apply '
alias gsp='git stash pop'
alias gu='git fetch upstream'
alias go='git fetch origin'
function gsad(){ git stash apply $@ && git stash drop $@; }

#npm command
alias np='npm publish'
alias nv='npm version '

alias ping-google='ping www.google.com'

#restart utility
alias restart-menu='killall -KILL SystemUIServer'
alias restart-dock='killall -KILL Dock'
alias restart-finder='killall -KILL Finder'
alias restart-mac='sudo shutdown -r now'
function restart-program(){ pkill -9 $@ && open -a $@; }

alias digitalocean='ssh 128.199.79.134'
alias wordpresshost='ssh 128.199.144.182'

export GREP_OPTIONS='--color=auto'
alias q='exit'
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

export ANDROID_HOME=/Users/lhtan/android-sdks
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH

#mongo db
export MONGO_PATH=/usr/local/mongodb
export PATH=$PATH:$MONGO_PATH/bin

#for cocoa pods
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

#kill port
killPortFunction(){
   #find port
   sudo lsof -i $1 | grep TCP | awk '{print $2}' | xargs kill -9
}
alias release-port=killPortFunction
