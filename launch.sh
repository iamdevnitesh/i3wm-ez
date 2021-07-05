#!/bin/bash

sudo apt update && sudo apt upgrade -y

# Installing kitty & setting it up
sudo apt install kitty -y
sudo update-alternatives --config x-terminal-emulator
echo " 2:$1"
mkdir $HOME/.config/kitty
cp $HOME/Downloads/i3wm-popOS/config/kitty/kitty.conf $HOME/.config/kitty/kitty.conf

# Installing vim
sudo apt install vim -y

# Neofetch
sudo apt install neofetch -y

# ulauncher install
sudo add-apt-repository ppa:agornostal/ulauncher -y
sudo apt update -y
sudo apt install ulauncher -y

# Installing required libraries
sudo apt install libxcb-glx0 libxcb-glx0-dev libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev libtool automake libxcb-shape0-dev xcb-proto cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb-composite0-dev python3-xcbgen libxcb-image0-dev libxcb-ewmh-dev libxcb-xrm-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev meson libxext-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-present-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libx11-xcb-dev -y

# SPEED RICER REPOSTIORY i3-gaps
sudo add-apt-repository ppa:kgilmer/speed-ricer -y
sudo apt update -y
sudo apt install i3-gaps -y

# Polybar Install
cd $HOME/Downloads
git clone https://github.com/stark/siji && cd siji
./install.sh
cd $HOME/Downloads
git clone --recursive https://github.com/polybar/polybar
cd $HOME/Downloads/polybar
mkdir build && cd build
cmake ..
make -j$(nproc)
sudo make install

# Picom install
cd $HOME/Downloads
git clone https://github.com/ibhagwan/picom.git
cd picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install

# installing numlockx
sudo apt install feh numlockx ttf-unifont -y

# Replacing files
mkdir $HOME/Pictures/Wallpapers
cp $HOME/Downloads/i3wm-popOS/Wallpapers/landscape1.jpg $HOME/Pictures/Wallpapers/landscape1.jpg
mkdir $HOME/.config/i3
cp $HOME/Downloads/i3wm-popOS/config/i3/config $HOME/.config/i3/config
mkdir $HOME/.config/polybar
mkdir $HOME/.config/picom
cp $HOME/Downloads/i3wm-popOS/config/polybar/config $HOME/.config/polybar/config
cp $HOME/Downloads/i3wm-popOS/config/polybar/launch.sh $HOME/.config/polybar/launch.sh
chmod +x $HOME/.config/polybar/launch.sh
cp $HOME/Downloads/i3wm-popOS/config/picom/picom.conf $HOME/.config/picom/picom.conf
