#!/bin/sh
# Opens A rofi menu with screenshot Options

chosen=$(echo "fullscreen\narea\narea [clipboard]\nactive window" | rofi -dmenu -lines 4 -width 25 -p "screenshot" -i)


case $chosen in
    "fullscreen")
        sleep 0.5; maim ~/screenshots/$(date "+%F_%H:%M:%S").png && notify-send '	screenshot saved!' -t 1500 || break
        ;;
    "area")
        maim -u -s ~/screenshots/$(date "+%F_%H:%M:%S").png && notify-send '	selected area screenshot saved!' -t 1500 || break
        ;;
    "area [clipboard")
        maim -s | xclip -selection clipboard -t image/png && notify-send '	screenshot copied to clipboard' -t 1500 || break
        ;;
    "active window")
	sleep 0.5; maim -u -i $(xdotool getactivewindow) ~/screenshots/$(date "+%F_%H:%M:%S").png && notify-send '	active window screenshot saved!' -t 1500 || break
	;;
esac

