#!/usr/bin/env bash

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Install Homebrew if not installed
if [[ ! $(which brew) ]]; then
  echo -e "Homebrew not installed, installing now..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file $DOTFILES/Brewfile

# Configure macOS settings
echo "Configuring macOS settings..."

# Turn off "Show suggested and recent items in Dock"
defaults write com.apple.dock show-recents -bool false

# Disable Quick Note hot corner (example: bottom-right)
defaults write com.apple.dock wvous-br-corner -int 0
defaults write com.apple.dock wvous-br-modifier -int 0

# Restart Dock to apply changes
killall Dock