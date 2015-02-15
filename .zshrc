# Path to your oh-my-zsh installation.
export ZSH=/Users/justinkim/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
 export EDITOR='vim'
else
 export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
 export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Load the themes system
autoload -U promptinit && promptinit
setopt PROMPT_SUBST

# load colors
autoload -U colors && colors

# This function is called in your prompt to output your active git branch.
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# \t shows the time
export PS1=$'\e[1;34m[%*]%{$reset_color%}%d$(parse_git_branch)$ '

#Node Path from Homebrew
export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"
source ~/.nvm/nvm.sh

#prioritizing usr directories in PATH
export USR_PATHS="/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin"
export PATH="$USR_PATHS:$PATH"

function desktop {
  cd /Users/$USER/Desktop/$@
}

function extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)  tar xjf $1      ;;
      *.tar.gz)   tar xzf $1      ;;
      *.bz2)      bunzip2 $1      ;;
      *.rar)      rar x $1        ;;
      *.gz)       gunzip $1       ;;
      *.tar)      tar xf $1       ;;
      *.tbz2)     tar xjf $1      ;;
      *.tgz)      tar xzf $1      ;;
      *.zip)      unzip $1        ;;
      *.Z)        uncompress $1   ;;
      *)          echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

function code {
  cd ~/Development/code
}

function data {
  cd ~/Development/data
}

#shortuct to go to sophomore fall
function sophspring {
  cd ~/Documents/sophomore_spring
}

#setting up terminal for work on ibr
function ibr {
  cd ~/Development/code/ibr
  vim .
}

function cis197 {
  cd ~/Development/code/cis197
}

# aliases
alias l="ls -lah"
alias gst="git status"
alias gl="git pull"
alias ga="git add ."
alias gp="git push"
alias gph="git push heroku master"
alias gd="git diff | mate"
alias gc="git commit -am"
alias gca="git commit -v -a"
alias gb="git branch"
alias gba="git branch -a"
alias go="git checkout"
alias gcb="git checkout -b"
alias rails_precompile="RAILS_ENV=production bundle exec rake assets:precompile"
alias viminstall="vim +PluginInstall +qall"

#prioritizing usr directories in PATH
export USR_PATHS="/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin"
export PATH="$USR_PATHS:$PATH"

#Android setup
export JAVA_HOME=/usr/local/java/jdk1.8.0_25
export PATH=$PATH:$HOME/bin:$JAVA_HOME/lib

#Postgres setup
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin

# OPAM configuration
. /Users/justinkim/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

#mandatory loading of RVM
source ~/.profile

