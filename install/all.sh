#!/bin/bash

echo "Installing fzf configuration for $(whoami)"

# ensure sudo access
sudo -p "Enter your password: " echo "We're good to go!"
if [ $? -ne 0 ]; then exit 1; fi

# change directory to home, in order to avoid directory conflicts
cd ~

# ensure updated zsh is the default shell
echo "Ensuring ZSH is the default shell"

# if homebrew is installed
if hash brew 2>/dev/null; then

  # if homebrew zsh is not the current shell
  brewpath="$(which brew | sed 's/\/brew//')"
  if [ "$SHELL" != "$brewpath/zsh" ]; then

    # install zsh if not already installed
    if [ -z "$(brew list | grep zsh)" ]; then
      echo "Installing ZSH via Homebrew"
      brew install zsh
    fi

    # include homebrew zsh path in /etc/shells
    if [ -z "$(grep -irn "$brewpath/zsh" /etc/shells)" ]; then
      echo "Whitelisting Homebrew installed ZSH"
      sudo -s "echo '$brewpath/zsh' >> /etc/shells"
    fi

    # change shell to homebrew zsh
    echo "Changing shell to homebrew installed zsh"
    chsh -s $brewpath/zsh
  fi
else
  # fallback to system zsh and display warning
  echo "Warning: Homebrew not found. Cannot install updated zsh version. Falling back to system zsh."
  chsh -s /bin/zsh
fi

# ensure dotfiles are up to date
sudo rm -rf $HOME/.dots
echo "Cloning fzf/dotfiles to $HOME/.dots"
git clone https://github.com/fzf/dotfiles.git $HOME/.dots --quiet

# install dotfiles
bash $HOME/.dots/install/dots.sh
bash $HOME/.dots/install/utils.sh
bash $HOME/.dots/install/node.sh
bash $HOME/.dots/install/bin.sh
bash $HOME/.dots/install/zsh.sh
bash $HOME/.dots/install/git.sh
bash $HOME/.dots/install/fonts.sh
bash $HOME/.dots/install/vim.sh
bash $HOME/.dots/install/osx.sh
bash $HOME/.dots/install/ubersicht.sh
bash $HOME/.dots/install/hammerspoon.sh
bash $HOME/.dots/install/sublime.sh

