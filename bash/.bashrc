#!/usr/bin/env bash

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='clean'

# Customize to your needs...
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:~/bin

# Set up TERM for good vim awesomeness
export TERM=xterm-256color

# Use vim to read man pages
# export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

# Load Bash It
source $BASH_IT/bash_it.sh

# If there's a bash session, source it
if [ -f ~/.bash_session ]
then
    . ~/.bash_session
fi

# Case insensitive completion
bind 'set completion-ignore-case on'

# Autocomplete in sudo mode
complete -cf sudo

# Activate LS_COLORS in config
eval `dircolors ~/.dircolors/dircolors.256dark`

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.fzf.bash ] && alias v='vi $(fzf)'
