#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep

# Install other useful binaries.
brew install cmake
brew install git
brew install gron
brew install imagemagick --with-webp
brew install jq
brew install the_silver_searcher
brew install tree
brew install tmux
brew install wget
brew install xz
brew install zlib
brew install fish

# Remove outdated versions from the cellar.
brew cleanup
