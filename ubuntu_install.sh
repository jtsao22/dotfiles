set -e

# Install neovim source list
sudo add-apt-repository ppa:neovim-ppa/stable

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Install sublime-text source list
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# Install ripgrep: https://github.com/BurntSushi/ripgrep
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb

# Install rofi ppa
sudo add-apt-repository ppa:jasonpleau/rofi

sudo apt-get update
sudo apt-get install meld git vim synergy konsole stow feh sublime-text neovim xclip tig blueman \
    caffeine pavucontrol gsimplecal zeal rofi xbacklight htop

# C++-specific installs (required for cquery)
sudo apt-get install cmake

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
stow --target=$HOME inputrc

fonts/install.sh

# Linux
# Zeal
# Sublime Text

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
/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2019.02.01_all.deb keyring.deb SHA256:176af52de1a976f103f9809920d80d02411ac5e763f695327de9fa6aff23f416
sudo dpkg -i ./keyring.deb
echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
sudo apt update
sudo apt install i3

# Install solarized theme for konsole
if [ -d ~/.kde4 ]; then
    KONSOLE_COLOR_SCHEME_PATH=~/.kde4/share/apps/konsole/
elif [ -d ~/.kde ]; then
    KONSOLE_COLOR_SCHEME_PATH=~/.kde/share/apps/konsole/
else
    KONSOLE_COLOR_SCHEME_PATH=~/.local/share/konsole/
fi

# Must start konsole first time to establish konsole path
konsole &

wget -O $KONSOLE_COLOR_SCHEME_PATH/SolarizedLight.colorscheme "https://raw.github.com/phiggins/konsole-colors-solarized/master/Solarized%20Light.colorscheme"
wget -O $KONSOLE_COLOR_SCHEME_PATH/SolarizedDark.colorscheme "https://raw.github.com/phiggins/konsole-colors-solarized/master/Solarized%20Dark.colorscheme"
wget -O $KONSOLE_COLOR_SCHEME_PATH/Dracula.colorscheme "https://raw.githubusercontent.com/dracula/konsole/master/Dracula.colorscheme"

mkdir -p ~/src
pushd ~/src

# Install DejaVu Sans Mono Nerd Font Complete:
wget -O DejaVu_Sans_Mono.ttf "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete.ttf" && sudo gnome-font-viewer DejaVu_Sans_Mono.ttf && rm DejaVu_Sans_Mono.ttf

# Install bumblebee and its dependencies
sudo easy_install pip
sudo pip install netifaces
git clone https://github.com/tobi-wan-kenobi/bumblebee-status.git

# Install cquery (C/C++ language server support) from https://github.com/cquery-project/cquery/wiki/Building-cquery
# First install clang dependency
sudo apt-get install clang
git clone --recursive https://github.com/cquery-project/cquery.git
pushd cquery
mkdir build && pushd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=release -DCMAKE_EXPORT_COMPILE_COMMANDS=YES
cmake --build .
cmake --build . --target install
popd
popd

popd
