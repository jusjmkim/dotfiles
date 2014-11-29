# This function is called in your prompt to output your active git branch.
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# \t shows the time
export PS1="\e[1;34m[\t]\e[0m\h:\W\$(parse_git_branch)$ "

#Node Path from Homebrew
export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"

#configures git not to require messages when merging
export GIT_MERGE_AUTOEDIT='no'

#opens sublime when program requires different editor
export VISUAL="subl -w"
export SVN_EDITOR="subl -w"
export GIT_EDITOR="subl -w"
export EDITOR="subl -w"

#prioritizing usr directories in PATH
export USR_PATHS="/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin"
export PATH="$USR_PATHS:$PATH"

#shortcut to go into desktop
function desktop {
  cd /Users/$USER/Desktop/$@
}

#a function to easily grep for a matching process
function psg {
  FIRST=`echo $1 | sed -e 's/^\(.\).*/\1/'`
  REST=`echo $1 | sed -e 's/^.\(.*\)/\1/'`
  ps aux | grep "[$FIRST]$REST"
}

#a function to extract correctly any archive based on extension
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

# A function to easily grep for a matching file
# USE: lg filename
function lg {
  FIRST=`echo $1 | sed -e 's/^\(.\).*/\1/'`
  REST=`echo $1 | sed -e 's/^.\(.*\)/\1/'`
  ls -la | grep "[$FIRST]$REST"
}

function code {
  cd ~/Development/code
}

function data {
  cd ~/Development/data
}

#access server 2 in gregory labs
function gregory2 {
  ssh kimjus@gregory-compute02.bio.upenn.edu
}

#shortuct to go to sophomore fall
function sophfall {
  cd ~/Documents/sophomore_fall
}

#setting up terminal for work on ibr
function ibr {
  cd ~/Development/code/ibr
  gnome-terminal --tab -e "subl ." --tab --tab 
}

# aliases
alias l="ls -lah"
alias gst="git status"
alias gl="git pull"
alias gp="git push"
alias gd="git diff | mate"
alias gc="git commit -am"
alias gca="git commit -v -a"
alias gb="git branch"
alias gba="git branch -a"
alias gcb="git checkout -b"
alias make_android_10="android -s create avd -f -n Android_2.3.3 -t android-10 --sdcard 64M --abi x86"
alias emulate_android_10="emulator -avd Android_2.3.3"
alias make_android_15="android -s create avd -f -n Android_4.0.3 -t android-15 --sdcard 64M --abi armeabi-v7a"
alias emulate_android_15="emulator -avd Android_4.0.3"
alias make_android_19="android -s create avd -f -n Android_4.4.2 -t android-19 --sdcard 64M --abi armeabi-v7a"
alias emulate_android_19="emulator -avd Android_4.4.2"
alias Open="xdg-open"

#increases palm detection
synclient PalmDetect=1 PalmMinWidth=10 PalmMinZ=200
#increase touch threshold
synclient FingerLow=0 FingerHigh=80 

#final configurations and plugins
#tab completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

#Android setup
export JAVA_HOME=/usr/local/java/jdk1.8.0_25
export PATH=$PATH:$HOME/bin:$JAVA_HOME/lib

#Postgres setup
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin

#mandatory loading of RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
