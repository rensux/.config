# Lines configured by zsh-newuser-install
HISTFILE='~/.config/zsh/.zsh_history'
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.config/zsh/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Load version control info
#autoload -Uz vcs_info
#precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
#zstyle ':vcs_info:git:*' formats '(%b) '

# Set up the prompt
setopt PROMPT_SUBST
PROMPT=''
PROMPT=$PROMPT$'%{\e[38;5;43m%}%n%{\e[m%}'				# username
PROMPT=$PROMPT$'%{\e[38;5;81m%}@%{\e[m%}'				# @
PROMPT=$PROMPT$'%{\e[38;5;38m%}%m%{\e[m%}'				# hostname
PROMPT=$PROMPT$'%{\e[38;5;194m%}:%{\e[m%}'				# :
PROMPT=$PROMPT$'%{\e[38;5;159m%}%~%{\e[m%} '				# pwd
PROMPT=$PROMPT$'%{\e[38;5;147m%}${vcs_info_msg_0_}%{\e[m%}'		# (git branch)
PROMPT=$PROMPT$'%{\e[38;5;81m%}$%{\e[m%} '				# $

# Source personal aliases
source $HOME/.config/profile/.alias

# Source personal env variables
source $HOME/.config/profile/.env

# Source cargo env variables
source "$HOME/.cargo/env"

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# start Starship
eval "$(starship init zsh)"

