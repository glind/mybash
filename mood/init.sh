#!/bin/bash
# init
figlet Welcome, $USER
echo -n "What's your mood? Skip this (s), Concentrate (c), Zen (z) or Work (w) or 80's (8), or Random (r)? "
read answer

if [ "$answer" == "${answer#[Ss]}" ] ;then
    ext=".jpg"
    rando=$(( $RANDOM % 10 ))
    imagepath="/Users/glind/mood/backgrounds/"

    echo -n "Start Playlist (y/n)? "
    read playlist


    if [ "$answer" != "${answer#[Cc]}" ] ;then
        path="/Library/Desktop Pictures/"	
        img="Earth Horizon.jpg"
        ext=""
        rando=""
        if [ "$playlist" != "${playlist#[Yy]}" ] ;then	
            osascript -e 'tell application "iTunes" to play the playlist named "Work"'
            osascript -e 'tell application "iTerm2" to tell current session of current window to split verically with profile "work"'
        fi
    elif [ "$answer" != "${answer#[8]}" ] ;then
        img="tech"
        if [ "$playlist" != "${playlist#[Yy]}" ] ;then
            osascript -e 'tell application "iTunes" to play the playlist named "Ready Player One"'
            osascript -e 'tell application "iTerm2" to tell current session of current window to split verically with profile "work"'
        fi
    elif [ "$answer" != "${answer#[Ff]}" ] ;then
        img="tech"
        if [ "$playlist" != "${playlist#[Yy]}" ] ;then
            osascript -e 'tell application "iTunes" to play the playlist named "Fun"'
            osascript -e 'tell application "iTerm2" to tell current session of current window to split verically with profile "work"'
        fi

    elif [ "$answer" != "${answer#[Zz]}" ] ;then
        img="zen"
        if [ "$playlist" != "${playlist#[Yy]}" ] ;then
            osascript -e 'tell application "iTunes" to play the playlist named "Zen"'
        fi
        osascript -e 'tell application "iTerm2" to tell current session of current window to split vertically with profile "zen"'
    else
        img="tech"
        if [ "$playlist" != "${playlist#[Yy]}" ] ;then
            osascript -e 'tell application "iTunes" to play the playlist named "Hacking"'
        fi
        osascript -e 'tell application "iTerm2" to tell current session of current window to split horizontally with profile "concentrate"'
        osascript -e 'tell application "iTerm2" to tell current session of current window to split vertically with profile "concentrate"'
    fi

    image=$imagepath$img$rando$ext
    echo $image
    osascript -e 'tell application "System Events" to set picture of every desktop to "'"${image//\"/\\\"}"'"' 
    osascript -e 'tell application "iTunes" to set shuffle enabled to true'
        echo -n "Cleanup Docker (y/n)"
        read docker

        if [ "$docker" != "${docker#[Yy]}" ] ;then
            docker kill $(docker ps -a -q)
            docker rm $(docker ps -a -q)
            docker rmi $(docker images -q)
        fi
fi
cd ~/Projects	
