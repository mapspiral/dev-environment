#!/bin/bash

# Install and configure Brew package manager
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Meslo font
pushd /tmp
curl -OL https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%22NF%20Regular.ttf
mv ./MesloLGS%20NF%20Regular.ttf ~/Library/Fonts/
popd

# Configure Terminal
cp ./apps/com.apple.Terminal.plist ~/Library/Preferences/com.apple.Terminal.plist

# Install oh-my-zsh
/bin/bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

brew install romkatv/powerlevel10k/powerlevel10k

# Install oh-my-zsh packages
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install application packages
brew install iterm2 visual-studio-code 1password kubectl helm pock spotify microsoft-office signal dotnet microsoft-teams slack rider tor-browser

brew install --cask transmission

# Install application packages - k8s
brew install kubectl helm

# Install oh-my-zsh dependencies
brew install autojump fzf

# Install yabai (csrutil disable, add under Accessibility)
brew install --HEAD xorpse/formulae/yabai
ln ./dotfiles/yabairc ~/.config/yabai/yabairc
brew services start yabair

brew install koekeishiya/formulae/skhd
mkdir -p ~/.config/skhd
ln ./dotfiles/skhdrc ~/.config/skhd/skhdrc
brew services start skhd

# Apply oh-my-zsh configuration
rm ~/.zshrc
ln -s ./dotfiles/.zshrc ~/.zshrc
rm ~/.p10k.zsh
ln -s ./dotfiles/.p10k.zsh ~/.p10k.zsh
