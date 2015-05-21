# Path to your oh-my-zsh installation.
export ZSH=/Users/justinkim/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"

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
 ENABLE_CORRECTION="true"

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
plugins=(osx)

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

# Git Info
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[white]%}on%{$reset_color%} git:%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}x"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}o"

: <<'FORMAT'
Prompt format:

PRIVILEGES USER @ MACHINE in DIRECTORY on git:BRANCH STATE [TIME] L:SHELL_LEVEL N:LINE_NUM
$ COMMAND

For example:

% ys@ys-mbp in ~/.oh-my-zsh on git:master x [21:47:42] L:1 N:6
$ 

FORMAT

PROMPT="
%{$terminfo[bold]$fg[blue]%}%#%{$reset_color%} \
  %{$fg[cyan]%}%n \
  %{$fg[white]%}@ \
  %{$fg[green]%}%m \
  %{$fg[white]%}in \
  %{$terminfo[bold]$fg[yellow]%}%~%{$reset_color%}\
  ${git_info} \
  %{$fg[white]%}[%*] L:%L N:%i
%{$terminfo[bold]$fg[red]%}$ %{$reset_color%}"

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
  cd ~/Development/code/whartonibr
  vim .
}

function cis196 {
cd ~/Development/code/cis196
}

function sshcis196 {
ssh cis196@eniac.seas.upenn.edu
}


function maketex {
  pdflatex *.tex
  open *.pdf
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

