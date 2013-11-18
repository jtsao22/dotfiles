#!/usr/bin/env bash

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='clean'

# Customize to your needs...  
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Set up TERM for good vim awesomeness
export TERM=xterm-256color

# If there's a bash profile, source it
if [ -f ~/.bash_profile ];
then
    . ~/.bash_profile
fi

# Load Bash It
source $BASH_IT/bash_it.sh

# Autocomplete in sudo mode
complete -cf sudo

# Activate LS_COLORS in config
eval `dircolors ~/.dircolors/dircolors.256dark`

# ls right away
ls

