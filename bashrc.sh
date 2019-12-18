#!/bin/bash

# Emacs
export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -nw"
export VISUAL="emacsclient -c -n"

# Paths
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# Python
export PYTHONSTARTUP=$HOME/.pythonrc.py

# Aliases
alias cdd="cd ../"
alias cddd="cd ../../"
alias cdddd="cd ../../../"
alias rm="rm -i"
alias refresh="clear; echo 'Current Directory'; pwd -P; echo 'Contents:'; ls -l"
alias myps="ps -o user,time,pgid,pid,comm"

if [ `top -h | head -1 | awk '{print $2}'` == "procps" ]; then
    alias top="top -aM"
fi

# Set prompt colours
function reset_prompt {
    COLOR1="\[$(tput setaf 1)\]"
    COLOR2="\[$(tput setaf 3)\]"
    BOLD="\[$(tput bold)\]"
    RESET="\[$(tput sgr0)\]"
    export PS1="[$(hostname -s)] ${COLOR1}${BOLD}λ${RESET} ${COLOR2}>${RESET} "
}

# Check if shell running interactively
if [[ "$-" == *"i"* ]]; then
    
    # Git (ask for password in terminal)
    unset SSH_ASKPASS
    
    # Readline history search
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'

    # Emacs daemon
    if ! emacsclient -e 0 >&/dev/null ; then
	emacs --daemon
    fi
    alias edit="$EDITOR"

    # Set prompt
    reset_prompt

fi
