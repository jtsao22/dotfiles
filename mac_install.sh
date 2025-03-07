#/usr/bin/env bash

# Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install rg fd fzf eza neovim bash-completion bat autojump tig bash-completion jq htop tpm git-delta starship lazygit watchexec lbzip2

# Php is needed for Alfred Calculate Anything workflow
brew install php

casks=(
    alfred
    caffeine # REMEMBER: install alfred workflows in ~/Library/Application\ Support/Alfred folder
    firefox  # REMEMBER: Copy over firefox profile
    google-chrome
    hammerspoon
    itsycal
    karabiner-elements
    obsidian # REMEMBER: Copy over .obsidian folder
    rectangle
    shottr
    spotify
    visual-studio-code # REMEMBER: Download plugins like remote ssh
    wezterm
)

for cask in "${casks[@]}"; do
    brew install --cask "$cask"
done

# JankyBorders for Yabai window borders: https://github.com/FelixKratz/JankyBorders?tab=readme-ov-file
brew tap FelixKratz/formulae
brew install borders

# Yabai, skhd: https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release)
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd
pip install yabai-stack-navigator
# Stackline: https://github.com/AdamWagner/stackline
# Stackline depends on hammerspoon: https://github.com/Hammerspoon/hammerspoon
# Get the repo
git clone https://github.com/AdamWagner/stackline.git ~/.hammerspoon/stackline
# Make stackline run when hammerspoon launches
cd ~/.hammerspoon
echo 'stackline = require "stackline"' >>init.lua
echo 'stackline:init()' >>init.lua

# Rustup instead of brew (brew only allows one version of rust)
curl https://sh.rustup.rs -sSf | sh

# Make dock showup instantly and go away instantly
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -int 0
killall Dock

# REMEMBER: Show bluetooth in the menu toolbar:
# choose Apple menu > System Settings, then click Control Center in the sidebar. (You may need to scroll down.)
# Click the pop-up menu next to Bluetooth, then choose Show in Menu Bar.

# REMEMBER: Change scroll direction:
# To change the scroll direction for your Mac's trackpad, click the Apple menu → click System Settings
# → select Trackpad → click Scroll & Zoom → toggle Natural scrolling on or off.

# Use shottr for screenshots, but if must use mac's, use jpg
defaults write com.apple.screencapture type jpg

# Make dock icons grey if it's hidden
defaults write com.apple.Dock showhidden -bool TRUE && killall Dock

# Show battery percentage
# System Preferences -> System Settings, then click Control Center in the sidebar. (You may need to scroll down.) Open Control Center settings for me.
# Go to Battery on the right, then turn on Show Percentage.

# lbzip2
brew install lbzip2
