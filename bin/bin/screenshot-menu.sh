#!/bin/sh

chosen=$(echo "fullscreen\narea\narea [clipboard]\nactive window" | rofi -dmenu -lines 4 -p "screenshot" -i)


case $chosen in
    "fullscreen")
        sleep 1; scrot '%F_%T_scrot.png' -e 'mv $f ~/screenshots/'; notify-send '	screenshot saved!'
        ;;
    "area")
        maim -s ~/screenshots/$(date "+%F-%H-%M-%S").png; notify-send '	selected area screenshot saved!'
        ;;
    "area [clipboard")
        maim -s | xclip -selection clipboard -t image/png; notify-send '	screenshot copied to clipboard'
        ;;
    "active window")
	sleep 1; scrot -u -b '%F_%T_scrot.png' -e 'mv $f ~/screenshots/'; notify-send '	active window screenshot saved!'
	;;
esac

