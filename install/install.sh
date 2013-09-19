#!/bin/bash

# set up default development directory
dev="$HOME/Development"
dotfiles="$dev/dotfiles"

echo "Installing SanguineRane configuration for $(whoami)"

# change directory to home, in order to avoid directory conflicts
cd ~

# ensure updated zsh is the default shell
echo "Ensuring ZSH is the default shell"

if [ "$SHELL" != "/usr/local/bin/zsh" ]; then
  # if homebrew installed zsh isn't the default shell

  if [ -z "$(grep -irn /usr/local/bin/zsh /etc/shells)" ]; then
    # if homebrew install zsh is not yet whitelisted

    if hash brew 2>/dev/null; then
      # if homebrew is installed

      # install zsh if not already installed
      if [ -z "$(brew list | grep zsh)" ]; then
        echo "Installing ZSH via homebrew."
        brew install zsh
      fi

      # include homebrew zsh path in /etc/shells
      sudo -s 'echo "/usr/local/bin/zsh" >> /etc/shells'

      # change shell to homebrew zsh
      echo "Changing shell to homebrew installed zsh"
      chsh -s /usr/local/bin/zsh
    else
      # fallback to system zsh and display warning
      echo "Warning: Homebrew not found. Cannot install updated zsh version. Falling back to system zsh."
      chsh -s /bin/zsh
    fi
  else
    # if already whitelisted in shell list, use brew installed zsh
    echo "Changing shell to homebrew installed zsh"
    chsh -s /usr/local/bin/zsh
  fi
fi

# create default directory structure
echo "Ensuring expected directory hierarchy is in place."
mkdir -p $dev $dev/personal $dev/work $dev/opensource
# ensure dotfiles is up to date
sudo rm -rf $dotfiles
echo "Cloning darrenli/dotfiles to $dotfiles"
git clone git@github.com:darrenli/dotfiles.git $dotfiles --quiet

# install dotfiles
bash $dotfiles/install/install-dotfiles.sh
# install terminal utilites
bash $dotfiles/install/install-utilities.sh
# install zsh configuration
bash $dotfiles/install/install-zshconfig.sh
# install git configuration
bash $dotfiles/install/install-gitconfig.sh
# install fonts
bash $dotfiles/install/install-fonts.sh
# install vim configuration
bash $dotfiles/install/install-vimconfig.sh
# install os x configuration
bash $dotfiles/install/install-osxconfig.sh
