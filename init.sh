#!/bin/sh
set -eu

is_setup() {
  echo "Do you setup $1? [y/N]"
  while :
  do
    read -r answer
    case $answer in
      'yes' | 'y') return 0 ;;
      [nN]o | 'N') return 1 ;;
      *) echo "Try again because you input incorrect letter. Do you setup $1? [y/N]" ;;
    esac
  done
}

# TODO: https://github.com/k0kubun/dotfiles のように、
if [ "$(uname)" = 'Darwin' ]; then
  if is_setup 'Xcode Command Line Tools'; then
    xcode-select --install
  fi

  if is_setup 'Homebrew'; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew doctor
  fi

  if is_setup 'some tools by Homebrew and Homebrew cask'; then
    ~/dotfiles/brew.sh
    ~/dotfiles/cask.sh
  fi
elif [ "$(lsb_release -is)" = 'Ubuntu' ]; then
  if is_setup 'packages via apt'; then
    ~/dotfiles/apt.sh; sudo snap install alacritty --classic
  fi
fi

if [ ! -d $HOME/dotfiles ]; then
  git clone https://github.com/entyo/dotfiles-mitamae.git ~/dotfiles
fi

~/dotfiles/bin/setup_mitamae.sh
~/dotfiles/deploy.sh
