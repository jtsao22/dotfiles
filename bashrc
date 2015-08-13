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

# Use vim to read man pages
# export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

# Load Bash It
source $BASH_IT/bash_it.sh

# If there's a bash session, source it
if [ -f ~/.bash_session ]
then
    . ~/.bash_session
fi

# Autocomplete in sudo mode
complete -cf sudo

# Activate LS_COLORS in config
eval `dircolors ~/.dircolors/dircolors.256dark`

# Use bash completion
if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion

    # Git autocompletion for aliases
    __git_complete grm _git_rm
    __git_complete ga _git_add
    __git_complete gc _git_commit
    __git_complete gco _git_checkout
    __git_complete gpl _git_pull
    __git_complete gps _git_push
    __git_complete gd _git_diff
    __git_complete gl _git_log
    __git_complete gb _git_branch
fi

# use ccache
export USE_CCACHE=1

# ls right away
ls
