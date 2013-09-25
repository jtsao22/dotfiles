#!/usr/bin/env bash

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='clean'

# Set my editor and git editor
export EDITOR="/usr/bin/vim "
export GIT_EDITOR='/usr/bin/vim'

# Customize to your needs...  
export PATH=$PATH:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/lib/jvm/bin

# Add repo for repo tools
export PATH=$PATH:$HOME/bin

# Add androgenizer for kindle builds
export PATH=$PATH:$HOME/bin/androgenizer

# Customize PROMPT if inside chroot
debian_chroot=$(cat /etc/debian_chroot 2> /dev/null)
if [ "zircon-dev" = "$debian_chroot" ]; then

    export DISPLAY=:0.0

else
    # Set up opencv
    #export OpenCV_DIR=/home/jtsao22/Programs/opencv-2.4.6.1/build/
    #export OpenCV_DIR=/shimmer/3rdparty/share/OpenCV/

    ## Openni directory
    source ~/Documents/src/OpenNI-Linux-x64-2.2/OpenNIDevEnvironment
    source ~/Documents/src/NiTE-Linux-x64-2.2/NiTEDevEnvironment

    export OPENNI_ARM_DIR=/home/jtsao22/Documents/src/OpenNI-Linux-Arm-2.2
    export OPENNI2_ARM_INCLUDE=$OPENNI_ARM_DIR/Include
    export OPENNI2_ARM_REDIST=$OPENNI_ARM_DIR/Redist
    export NITE2_ARM_DIR=/home/jtsao22/Documents/src/NiTE-Linux-x86-2.2
    export NITE2_ARM_INCLUDE=$NITE2_ARM_DIR/Include
    export NITE2_ARM_REDIST=$NITE2_ARM_DIR/Redist
    export ARM_CXX=/usr/bin/arm-linux-gnueabihf-g++ 
    export ARM_STAGING=Bin

    export OPENNI_DIR=/home/jtsao22/Documents/src/OpenNI-Linux-x64-2.2
    export NITE2_DIR=/home/jtsao22/Documents/src/NiTE-Linux-x64-2.2
    export LD_LIBRARY_PATH=$OPENNI_DIR/Redist:$NITE2_DIR/Redist
    #export OPENNI2_INCLUDE=$OPENNI_DIR/Include/
    #export OPENNI2_REDIST=$OPENNI_DIR/Redist/

    # Start tmux if its not already started
    export TERM=screen-256color
    #[[ -z "$TMUX" ]] && exec tmux

    # Access chroot right away
    #schroot -c zircon-dev

fi

# Set up TERM for good vim awesomeness
export TERM=xterm-256color

# Kindle stuff for cross compiling
export ARCH=arm
#export CROSS_COMPILE=arm-none-gnueabi-
export CROSS_COMPILE=/home/jtsao22/CodeSourcery/Sourcery_CodeBench_Lite_for_ARM_GNU_Linux/bin/arm-none-linux-gnueabi-
#export PLATFORM=tate

# Set up manx libraries
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/jtsao22/wrk-manx/manx/_build/x64/install/lib

# Load Bash It
source $BASH_IT/bash_it.sh

# Autocomplete in sudo mode
complete -cf sudo

# ls right away
ls
