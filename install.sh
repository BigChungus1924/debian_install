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

sudo apt install i3 chromium network-manager nm-applet nmcli blueberry brightlight gimp blender kdenlive mousepad dunst htop pcmanfm neofetch lxappearence feh polybar xorg compton cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

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



