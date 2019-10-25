#!/bin/sh

# fish shell (1)
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update && sudo apt upgrade

# Unneeded packages(Ubuntu gnome 16.04.4)
sudo apt remove libreoffice-* gnome-accessibility-themes gnome-contacts gnome-mahjongg gnome-mines gnome-orca gnome-screensaver gnome-sudoku gnome-video-effects gnomine gnome-calendar gnome-calculator gnome-contacts gnome-getting-started-docs* gnome-maps gnome-logs gnome-music gnome-sushi evolutionsudo apt update && sudo apt upgrade
sudo apt remove libreoffice-* gnome-accessibility-themes gnome-contacts gnome-mahjongg gnome-mines gnome-orca gnome-screensaver gnome-sudoku gnome-video-effects gnomine gnome-calendar gnome-calculator gnome-contacts gnome-getting-started-docs* gnome-maps gnome-logs gnome-music gnome-sushi evolution firefox xterm

sudo apt install git build-essential g++ cmake cmake-curses-gui openssl pkg-config zlib1g-dev libuv-dev ffmpeg vlc imagemagick vim-gnome ranger gimp kazam curl libevent-dev ncurses-base libncurses5-dev libncursesw5-dev xclip dconf-cli autoconf automake ibus-mozc snapd jq fish unar alacritty