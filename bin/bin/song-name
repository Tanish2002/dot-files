#!/bin/sh
#
# http://github.com/mitchweaver/bin
#
# nicely display current song from mpvctl (also in bin)
#

artist=$($HOME/bin/mpvctl -k artist)
title=$($HOME/bin/mpvctl -k title)

if [ "$artist" != null ] && [ "$title" != null ] ; then
    printf '%s - %s\n' "$artist" "$title"
else
    res=$($HOME/bin/mpvctl -k filename)
    case $res in
        *'.'*)
            # must be a local file
            printf '%s\n' "$res"
            ;;
        *)
            # youtube watch codes are always 11 chars long
            if [ ${#res} -eq 11 ] ; then
                pgrep -f youtube-dl >/dev/null ||
                ytdl=$(youtube-dl -e "http://youtube.com/watch?v=$res" 2>/dev/null)
                                [ "$ytdl" ] && printf '%s\n' "$ytdl"
            fi
    esac
fi
