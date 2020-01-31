
# Check for Linus OS
# All LInux configs here
if [[ "$OSTYPE" == "linux-gnu" ]]; then

echo "This is LINUXXX!!!!!!"

# Copy in zshrc
cp ./.zshrc ~/
# Copy in vimrc
cp ./.vimrc ~/
# Make dir for vim color theme
mkdir -p ~/.vim/colors
# Copy in vim color theme
cp ./solarized.vim ~/.vim/colors


# Check for 'darwin' / mac OS - wtc)
# All mac configs here
elif [[ "$OSTYPE" == "darwin"* ]]; then

echo "This is DARWINNNN!!!!!!"

# Set dark theme because we like our eyes
osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to not dark mode'

# Start arranging apps || Make these apps persitent
# Persistent Apps: These are the apps that have some data that need to survive restart, crash, container update and etc.
 defaults write com.apple.dock persistent-apps -array
# LAUNCHPAD
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Launchpad.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
# GOOGLE CHROME
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Google Chrome.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
# ITERM
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/iTerm.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
# SLACK
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Slack.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
# SYSTEM PREFERENCES
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/System Preferences.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

# Install homebrew for wtc macs
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Tolsadus/42homebrewfix/master/install.sh)"
# Once homebrew installed - insstall npm
brew install npm

# Resizes dock icons
defaults write com.apple.dock tilesize -int 75

# Copy in zshrc
cp ./.zshrc ~/
# Copy in vimrc
cp ./.vimrc ~/
# Make dir for vim color theme
mkdir -p ~/.vim/colors
# Copy in vim color theme
cp ./solarized.vim ~/.vim/colors

# Kill all unnused / unneccesary apps in dock (wtc macs)
killall Dock

# Clear Terminal
clear

echo "\n\n\n\n\n\n\n\n\n\n\nPlease terminate terminal for changes to take effect\nThis will close all Terminals!!"

# Sign into wtc students slack channel for comms
open -a "Google Chrome" https://wethinkcodestudents.slack.com/

# Quit terminal for configs to take effect
osascript -e 'tell application "Terminal" to quit'

fi
