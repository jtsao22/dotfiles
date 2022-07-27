#!/usr/bin/env bash

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='clean'

# Customize to your needs...
export
PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:~/bin:~/src/python-3.6.9/bin:$HOME/.toolbox/bin

# Set up TERM for good vim awesomeness
export TERM=xterm-256color

# Use vim to read man pages
# export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

#set editing-mode vi
set -o vi

# Load Bash It
source $BASH_IT/bash_it.sh

# If there's a bash session, source it
if [ -f ~/.bash_session ]
then
    . ~/.bash_session
fi

# Autocomplete in sudo mode
complete -cf sudo

# Change writing to history file mode to append, and save command to history for every cmd
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# Activate LS_COLORS in config
eval `dircolors ~/.dircolors/dircolors.256dark`

# Automate ssh-agent startup
[ -z "$SSH_AUTH_SOCK"  ] && eval "$(ssh-agent -s)"
. "$HOME/.cargo/env"

# Kitty
alias icat="kitty +kitten icat"
