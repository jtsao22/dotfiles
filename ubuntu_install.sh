sudo apt-get install meld git vim synergy i3

# Linux
# Zeal
# Sublime Text
# DejaVu fonts (http://sourceforge.net/projects/dejavu/)

# Mac coreutils includes ls & grep
#brew install coreutils

# Install solarized in gnome-terminal!
sudo apt-get install dconf
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git
./install.sh

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
