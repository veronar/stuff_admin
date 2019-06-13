#!/usr/bin/sh

OS="`uname`"
case $OS in
	'Linux')
		echo "----- Linux -----";
		;;
	'Darwin')
		echo "----- MacOS -----";
		osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to true';
		echo "DarkMode";
		defaults write com.apple.dock persistent-apps -array
		
		defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Launchpad.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
		
		defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Google Chrome.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
		
		defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/iTerm.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
		
		defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Slack.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
		
		defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/System Preferences.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
		defaults write com.apple.dock tilesize -int 75
		killall Dock;
		cp ./basic/.bashrc ~
		;;
	*) ;;
esac

echo "---- Global ----"
read -p 'Username: ' uservar
touch ~/.bashrc
echo "export USER=$uservar" >> ~/.bashrc

echo "---- Setup ----"
cp -R ./basic/.vim ~/;
echo "Color + 42Header";
cp ./basic/.vimrc ~/;
echo "Vimrc";
cp ./basic/.gitignore ~/;
echo "Gitignore";

open -a "Google Chrome" https://wethinkcodestudents.slack.com/

echo "--- finished ---"

exit 0
