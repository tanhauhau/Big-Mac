#!/bin/bash
echo "Initializing..."
# don't have a git command yet, so download each file using curl. lol
mkdir backup
curl https://raw.githubusercontent.com/tanhauhau/Big-Mac/master/backup/bash > backup/bash
curl https://raw.githubusercontent.com/tanhauhau/Big-Mac/master/backup/brew > backup/brew
curl https://raw.githubusercontent.com/tanhauhau/Big-Mac/master/backup/npm > backup/npm
curl https://raw.githubusercontent.com/tanhauhau/Big-Mac/master/backup/pip > backup/pip

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
echo "Install git standup"
curl -L https://raw.githubusercontent.com/kamranahmedse/git-standup/master/installer.sh | sudo sh
echo "Install git praise"
sudo curl -o /usr/local/bin/git-praise -L https://raw.githubusercontent.com/ansman/git-praise/master/git-praise
sudo chmod +x /usr/local/bin/git-praise
