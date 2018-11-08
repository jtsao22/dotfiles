set -e

# Install neovim source list
sudo add-apt-repository ppa:neovim-ppa/stable

# Install sublime-text source list
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

sudo apt-get update
sudo apt-get install meld git vim synergy konsole stow feh sublime-text neovim xclip tig

git submodule init
git submodule sync
git submodule update

# Backup old bashrc
if [ -e ~/.bashrc ]; then
    mv ~/.bashrc ~/.bashrc_backup
fi

stow --target=$HOME i3
stow --target=$HOME vim
stow --target=$HOME bash_it
stow --target=$HOME dircolors
stow --target=$HOME config
stow --target=$HOME bash

fonts/install.sh

# Linux
# Zeal
# Sublime Text

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


# Install latest i3 from https://i3wm.org/docs/repositories.html
/usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2018.01.30_all.deb keyring.deb SHA256:baa43dbbd7232ea2b5444cae238d53bebb9d34601cc000e82f11111b1889078a
sudo dpkg -i ./keyring.deb
echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
sudo apt update
sudo apt install i3

 Install solarized theme for konsole
 if [ -d ~/.kde4 ]; then
   KONSOLE_COLOR_SCHEME_PATH=~/.kde4/share/apps/konsole/
 elif [ -d ~/.kde ]; then
   KONSOLE_COLOR_SCHEME_PATH=~/.kde/share/apps/konsole/
 else
   KONSOLE_COLOR_SCHEME_PATH=~/.local/share/konsole/
 fi

wget -O $KONSOLE_COLOR_SCHEME_PATH/SolarizedLight.colorscheme "https://raw.github.com/phiggins/konsole-colors-solarized/master/Solarized%20Light.colorscheme"
wget -O $KONSOLE_COLOR_SCHEME_PATH/SolarizedDark.colorscheme "https://raw.github.com/phiggins/konsole-colors-solarized/master/Solarized%20Dark.colorscheme"
wget -O $KONSOLE_COLOR_SCHEME_PATH/Dracula.colorscheme "https://raw.githubusercontent.com/dracula/konsole/master/Dracula.colorscheme"

mkdir -p ~/src
pushd ~/src

# Install DejaVu Sans Mono Nerd Font Complete:
wget -O DejaVu_Sans_Mono.ttf "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete.ttf" && sudo gnome-font-viewer DejaVu_Sans_Mono.ttf && rm DejaVu_Sans_Mono.ttf

# Get bumblebee and its dependencies
sudo easy_install pip
sudo pip install netifaces
git clone https://github.com/tobi-wan-kenobi/bumblebee-status.git

popd
