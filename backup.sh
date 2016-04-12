#!/bin/bash
echo "Initializing"
# don't have a git command yet, so download each file using curl. lol
mkdir backup
curl https://raw.githubusercontent.com/tanhauhau/Big-Mac/master/backup/bash > backup/bash
curl https://raw.githubusercontent.com/tanhauhau/Big-Mac/master/backup/brew > backup/brew
curl https://raw.githubusercontent.com/tanhauhau/Big-Mac/master/backup/npm > backup/npm
curl https://raw.githubusercontent.com/tanhauhau/Big-Mac/master/backup/pip > backup/pip

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
