#!/bin/bash

echo "Restore your mac cli...\n"
echo "Install brew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Install brew formulas..."
for formula in $( cat backup/brew ); do
    brew install $formula
done

echo "Install brew casks..."
for formula in $( cat backup/brew_cask ); do
    brew cask install $formula
done

echo "Install pip packages..."
for pip in $( cat backup/pip ); do
    pip install $pip
done

echo "Install Node..."
brew install node
echo "Node version: $( npm -v )"
echo "Install NPM packages..."
for package in $( cat backup/npm ); do
    npm install -g --save $package
done

echo "Install git..."
curl -L https://sourceforge.net/projects/git-osx-installer/files/git-2.7.1-intel-universal-mavericks.dmg > ~/Download/git.dmg
echo "Open git.dmg"
open ~/Download/git.dmg
