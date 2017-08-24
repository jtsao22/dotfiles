sudo apt-get install meld git vim synergy i3 konsole stow

git submodule init
git submodule sync
git submodule update

stow i3
stow vim
stow bash_it
stow dircolors
stow config
stow bash

fonts/install.sh

# Linux
# Zeal
# Sublime Text
# DejaVu fonts (http://sourceforge.net/projects/dejavu/)

# Mac coreutils includes ls & grep
#brew install coreutils

# Disable nautilus from starting a window containing the desktop icons:
gsettings set org.gnome.desktop.background show-desktop-icons false

# Install Faenza gnome icon theme
# google-chrome http://gnome-look.org/content/download.php?content=128143&id=1&tan=48958334
# vi ~/.config/gtk-3.0/settings.ini :
#[Settings]
#gtk-theme-name = Faenza
#gtk-font-name = Open Sans 8
#gtk-fallback-icon-theme = Mint-X
#gtk-icon-theme-name = Faenza-Dark


# Install latest i3:
# echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list
# apt-get update
# apt-get --allow-unauthenticated install sur5r-keyring
# apt-get update
# apt-get install i3

# Install solarized theme for konsole
if [ -d ~/.kde4 ]; then
  wget -qO ~/.kde4/share/apps/konsole/Solarized\ Light.colorscheme "https://raw.github.com/phiggins/konsole-colors-solarized/master/Solarized%20Light.colorscheme"
  wget -qO ~/.kde4/share/apps/konsole/Solarized\ Dark.colorscheme "https://raw.github.com/phiggins/konsole-colors-solarized/master/Solarized%20Dark.colorscheme"
else
  wget -qO ~/.kde/share/apps/konsole/Solarized\ Light.colorscheme "https://raw.github.com/phiggins/konsole-colors-solarized/master/Solarized%20Light.colorscheme"
  wget -qO ~/.kde/share/apps/konsole/Solarized\ Dark.colorscheme "https://raw.github.com/phiggins/konsole-colors-solarized/master/Solarized%20Dark.colorscheme"
fi
