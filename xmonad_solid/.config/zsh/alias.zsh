#Shortcuts
alias h="history"
alias p="pwd -P"
alias s="sudo -s"
alias ff='firefox'
alias netprocs="lsof -P -i -n"
alias update="sudo xbps-install -Svu"

# Xbps Aliases
alias xr="sudo xbps-remove"
alias xi="sudo xbps-install -S"
alias xrs="xbps-query -Rs"
alias xq="xbps-query -S"
alias xpkg="xbps-query -l"

alias lf="bash ~/bin/lfrun"
# So that sudo doesnt override aliases (doesnt work with flags)
# alias sudo='sudo '

#emacs
alias ed="devour emacsclient --socket-name=weeb-emacsd -c"
alias ee="devour emacs"

# neovim
alias vim="nvim"
alias init.vim="vim ~/.config/nvim/init.vim"
alias nvim="kak"
alias vim="kak"
# Quick edit
alias pac="sudo pacman -S"
alias rr="ranger"
alias xres="vim ~/.Xresources"
alias zshrc="vim ~/.zshrc"
alias i3config="vim ~/.config/i3/config"
alias polyconf="vim ~/.config/polybar/config"
alias dunstrc="vim ~/.config/dunst/dunstrc"
alias tint2rc="vim ~/.config/tint2/tint2rc"
alias userChrome.css="vim ~/thm/Firefox/userChrome.css"
alias stconf="vim ~/pro/xst/src/config.h"
alias playlists="vim ~/.config/mpv/tubify_playlists"
alias airlinevim="vim ~/.config/nvim/plugged/vim-airline/autoload/airline/themes/dark.vim"
alias quteconf="vim ~/.config/qutebrowser/config.py"
alias picomconf="vim ~/.config/picom/picom.conf"
# alias ls="/opt/coreutils/bin/ls"

# cpu governor
alias gameoff="sudo cpufreq-set -g powersave"
alias gameon="sudo cpufreq-set -g performance"

# Freeze and unfreeze processes (for example: stop firefox)
stop(){
  if [ $# -ne 1 ]; then
          echo 1>&2 Usage: stop process
  else
    PROCESS=$1
    echo "Stopping processes with the word ${tGreen}$1${tReset}"
    ps axw | grep -i $1 | awk -v PROC="$1" '{print $1}' | xargs kill -STOP
  fi
}

cont(){
  if [ $# -ne 1 ]; then
          echo 1>&2 Usage: cont process
  else
    PROCESS=$1
    echo "Continuing processes with the word ${tGreen}$1${tReset}"
    ps axw | grep -i $1 | awk -v PROC="$1" '{print $1}' | xargs kill -CONT
  fi
}

