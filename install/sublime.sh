#!/bin/bash
source "$HOME/.dots/install/core.cfg"

sudo rm -rf "$HOME/Library/Application Support/Sublime Text 3/Packages/User"

link "$HOME/.dots/sublime/User" "$HOME/Library/Application Support/Sublime Text 3/Packages/User"

link "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" "$HOME/bin/s"
