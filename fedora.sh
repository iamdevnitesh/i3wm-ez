#!/bin/bash

sudo dnf install kitty -y
gsettings set org.gnome.desktop.default-applications.terminal exec kitty
mkdir $HOME/.config/kitty
cp $HOME/Downloads/i3wm-ez/config/kitty/kitty.conf $HOME/.config/kitty/kitty.conf

# POLYBAR/ Alternative way is to build from source
sudo dnf install unifont-fonts -y
sudo dnf install xorg-x11-apps -y
sudo dnf install -y gcc-c++ clang git cmake @development-tools python3-sphinx python3-packaging
sudo dnf install -y cairo-devel xcb-util-devel libxcb-devel xcb-proto xcb-util-image-devel xcb-util-wm-devel
sudo dnf install -y xcb-util-xrm-devel xcb-util-cursor-devel alsa-lib-devel pulseaudio-libs-devel jsoncpp-devel libmpdclient-devel libcurl-devel wireless-tools-devel libnl3-devel
sudo dnf install polybar -y

# i3
sudo dnf install i3-gaps -y

# PICOM
sudo dnf install -y dbus-devel gcc git libconfig-devel libdrm-devel libev-devel libX11-devel libX11-xcb libXext-devel libxcb-devel mesa-libGL-devel meson pcre-devel pixman-devel uthash-devel xcb-util-image-devel xcb-util-renderutil-devel xorg-x11-proto-devel -y
cd $HOME/Downloads
git clone https://github.com/ibhagwan/picom.git
cd picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install

# FEH, NUMLOCKX, XSETROOT, MAIM & SLOCK
sudo dnf install feh numlockx xsetroot maim slock -y

# Replacing files
mkdir $HOME/.config/i3
cp $HOME/Downloads/i3wm-ez/config/i3/config $HOME/.config/i3/config
mkdir $HOME/.config/i3/gruvbox
cp -r $HOME/Downloads/i3wm-ez/gruvbox/* $HOME/.config/i3/gruvbox/
mkdir $HOME/.config/polybar
mkdir $HOME/.config/picom
cp $HOME/Downloads/i3wm-ez/config/polybar/config $HOME/.config/polybar/config
cp $HOME/Downloads/i3wm-ez/config/polybar/launch.sh $HOME/.config/polybar/launch.sh
chmod +x $HOME/.config/polybar/launch.sh
cp $HOME/Downloads/i3wm-ez/config/picom/picom.conf $HOME/.config/picom/picom.conf
