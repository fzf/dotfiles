echo "Ensuring no sleepimage files are generated"
# set hibernate mode to desktop
sudo pmset -a hibernatemode 0
# remove sleepimage
sudo rm -f /private/var/vm/sleepimage
# create immutable placeholder sleepimage
sudo touch /private/var/vm/sleepimage
sudo chflags uchg /private/var/vm/sleepimage

echo "Disabling OS X programs"
# disable os x dashboard
defaults write com.apple.dashboard mcx-disabled -boolean YES
killall Dock
# disable spotlight and its menu bar icon
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist 2>/dev/null
sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search
killall SystemUIServer

echo "Configuring system key press speeds"
# disable key hold popup menu
defaults write -g ApplePressAndHoldEnabled -bool false
# set key repeat rates
defaults write -g InitialKeyRepeat -int 12
defaults write -g KeyRepeat -int 3

echo "Disabling natural scrolling"
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

echo "Enabling Finder status bar"
defaults write com.apple.finder ShowStatusBar -bool true

echo "Setting hidden dock applications as translucent"
defaults write com.apple.dock showhidden -bool true

# ensure changes take effect immediately
killall Dock
killall Finder
killall SystemUIServer