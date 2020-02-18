#!/usr/bin/env bash
#
# center text and hide ui

# \e[?25h : show cursor
trap $'printf \e[?25h' EXIT

# get terminal size
shopt -s checkwinsize; (:)

fun() {
    printf -v string '%s%*s' "$string" $(((COLUMNS + ${#2}) / 2)) "$2"
}

# center text
{ mapfile -C fun -c1 file < "$1"; } 2> /dev/null || {
    echo "usage : ${0##*/} [file]" >&2
    exit 1
}

# \e[2J   : clear screen
# \e[?25l : hide cursor
# \e[<n>H : print in <n>
read -rst 10 -p $'\e[2J\e[?25l\e['"$(((LINES - ${#file[@]}) / 2 + 1))H$string"
