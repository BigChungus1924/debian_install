#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

cd $builddir
mkdir -p /home/$username/.config
mkdir -p /home/$username/.config/alacritty
mkdir -p /home/$username/.config/i3
mkdir -p /home/$username/Pictures
mkdir -p /home/$username/.config/polybar
mkdir -p /home/$username/.themes
mkdir -p /home/$username/.icons


cp config.ini /home/$username/.config/polybar
cp wallpaper.jpg /home/$username/Pictures
cp Orchis-Dark-Compact /home/$username/.themes
cp config  /home/$username/.config/i3
cp alacritty.yml /home/$username/.config/alacritty

sudo apt install i3 xorg compton nitrogen polybar conky neofetch pcmanfm network-manager nm-tray lxpolkit meson dh-autoreconf libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev libxcb-shape0 libxcb-shape0-dev cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

nitrogen /home/$username/Pictures/wallpaper.jpg

cd /home/$username/

git clone https://github.com/alacritty/alacritty.git
cd alacritty

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

source ~/.bashrc

cargo build --release

sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

sudo apt update && sudo apt install -y gnupg
gpg --keyserver keyserver.ubuntu.com --recv 0xfaf1020699503176
gpg --export 0xfaf1020699503176 | sudo tee /usr/share/keyrings/ulauncher-archive-keyring.gpg
sudo echo "deb [signed-by=/usr/share/keyrings/ulauncher-archive-keyring.gpg] \
          http://ppa.launchpad.net/agornostal/ulauncher/ubuntu focal main" \
          > /etc/apt/sources.list.d/ulauncher-focal.list
sudo apt update && sudo apt install ulauncher


