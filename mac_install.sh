brew install rg fd fzf exa neovim bash-completion bat autojump

# Reminder to install alfred workflows in alfred folder

# Make dock showup instantly and go away instantly
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -int 0
killall Dock

# Use shottr for screenshots, but if must use mac's, use jpg
defaults write com.apple.screencapture type jpg

# Make dock icons grey if it's hidden
defaults write com.apple.Dock showhidden -bool TRUE && killall Dock
