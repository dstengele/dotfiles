STATUS=$(defaults read com.apple.Finder AppleShowAllFiles)
echo Current Status: $STATUS
if [[ $STATUS == 0 ]]; then
    defaults write com.apple.Finder AppleShowAllFiles 1
    echo Now showing hidden files
fi
if [[ $STATUS == 1 ]]; then
    defaults write com.apple.Finder AppleShowAllFiles 0
    echo Now hiding hidden files
fi
exit
