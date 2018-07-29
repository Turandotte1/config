# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/mariya/.oh-my-zsh"

ZSH_THEME="powerlevel9k/powerlevel9k"

prompt_zsh_battery_level() {
    percentage=`pmset -g batt | egrep "([0-9]+\%).*" -o --colour=auto | cut -f1 -d';' | grep -oe '\([0-9.]*\)'`
    local color='%F{red}'
    local symbol="\uf00d"
if [ "$(bc <<< "scale=2 ; $percentage<25")" = '1' ]
    then symbol="\uf244" ; color='%F{red}' ;
        #Less than 25
        fi  
if [ "$(bc <<< "scale=2 ; $percentage>=25")" = '1' ] && [ "$(bc <<< "scale=2 ; $percentage<50")" = '1' ]
    then symbol='\uf243' ; color='%F{red}' ;
    #25%
    fi
if [ "$(bc <<< "scale=2 ; $percentage>=50")" = '1' ] && [ "$(bc <<< "scale=2 ; $percentage<75")" = '1' ]  
    then symbol="\uf242" ; color='%F{yellow}' ;
     #50%
     fi
if [ "$(bc <<< "scale=2 ; $percentage>=75")" = '1' ] && [ "$(bc <<< "scale=2 ; $percentage<100")" = '1' ]
    then symbol="\uf241" ; color='%F{blue}' ;
        #75%
        fi  
if [ "$(bc <<< "scale=2 ; $percentage>99")" = '1' ]
    then symbol="\uf240" ; color='%F{green}' ;
        #100%
        fi
pmset -g batt | grep "discharging" >& /dev/null
if [ $? -eq 0 ]; then
    true;
else ;
   color='%F{green}' ;
fi
echo -n "%{$color%}$symbol " 
}

POWERLEVEL9K_MODE='nerdfont-complete'

# OS segment
POWERLEVEL9K_OS_ICON_BACKGROUND="white"
POWERLEVEL9K_OS_ICON_FOREGROUND="blue"

# Dirs
POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2

# Context
POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='green'
POWERLEVEL9K_CONTEXT_TEMPLATE="%F{cyan}%n%f"
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='black'

# Status
POWERLEVEL9K_STATUS_VERBOSE=true
POWERLEVEL9K_STATUS_CROSS=true

# Double-Lined Prompt
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{014}╭%F{cyan}"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{014}\u2570%F{cyan}\uF460%F{073}\uF460%F{109}\uF460%f "

# battery
POWERLEVEL9K_BATTERY_CHARGING='yellow'
POWERLEVEL9K_BATTERY_CHARGED='green'
POWERLEVEL9K_BATTERY_DISCONNECTED='$DEFAULT_COLOR'
POWERLEVEL9K_BATTERY_LOW_THRESHOLD='10'
POWERLEVEL9K_BATTERY_LOW_COLOR='red'
POWERLEVEL9K_BATTERY_ICON=`prompt_zsh_battery_level `

# Time
POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M \uf073 %d.%m.%y}"
POWERLEVEL9K_TIME_BACKGROUND='blue'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon root_indicator context dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs command_execution_time ram virtualenv rbenv rvm battery ip time)

DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"

plugins=(
  git
  npm
)

source $ZSH/oh-my-zsh.sh

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

alias vi="nvim"
alias vim="nvim" 
alias zshconfig="nvim ~/.zshrc"
alias gl="git log -n 15 --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gclean="git reset --hard && git clean -dfx"
alias please="sudo"
alias fuck="pkill -9"

function lazyme() {
    git add .
    git commit -a -m "$1"
    git push
}
