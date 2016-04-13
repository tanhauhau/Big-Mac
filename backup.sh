#!/bin/bash
echo "Get bash profile"
cat ~/.bash_profile > backup/bash

echo "Get brew formulas"
brew list > backup/brew

echo "Get brew cask formulas"
brew cask list > backup/brew_cask

echo "Get pip installation"
pip list | awk '{ print $1 }' > backup/pip

echo "Get npm global packages"
npm list -o -g --depth=0 | awk '/^├─/ { print $2 }' > backup/npm
