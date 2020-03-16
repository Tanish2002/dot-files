# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$HOME/.emacs.d/bin:$PATH
FORCE_UNSAFE_CONFIGURE=1
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
#eval "$(starship init zsh)"

# Autojump
#. /usr/share/autojump/autojump.zsh

# Import colorscheme from wal
#(wal -r &)

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh
#. "${HOME}/.cache/wal/colors.sh"
#source ${HOME}/.cache/wal/colors.sh

# User configuration

export HISTSIZE=999999
export SAVEHIST=999999
# export MANPATH="/usr/local/man:$MANPATH"

# Cursor
#echo -e -n "\x1b[\x30 q" # changes to blinking block
#echo -e -n "\x1b[\x31 q" # changes to blinking block also
#echo -e -n "\x1b[\x32 q" # changes to steady block
#echo -e -n "\x1b[\x33 q" # changes to blinking underline
#echo -e -n "\x1b[\x34 q" # changes to steady underline
#echo -e -n "\x1b[\x35 q" # changes to blinking bar
echo -e -n "\x1b[\x36 q" # changes to steady bar

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Find new executables in path
zstyle ':completion:*' rehash true

#This causes pasted URLs to be automatically escaped, without needing to disable globbing.
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic


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

export EDITOR=nvim
export BROWSER=firefox

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias h="history"
alias p="pwd -P"
alias s="sudo -s"
alias CD="cd"
alias ff='firefox'
alias netprocs="lsof -P -i -n"
alias update="sudo xbps-install -Svu"
# So that sudo doesnt override aliases (doesnt work with flags)
# alias sudo='sudo '

# neovim
alias vim="nvim"
alias init.vim="vim ~/.config/nvim/init.vim"

# Quick edit
alias pac="sudo pacman -S"
alias rr="ranger"
alias xr="vim ~/.Xresources"
alias xrc="vim ~/.wally/Xresources-clean"
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
alias ls="/opt/coreutils/bin/ls"

# cpu governor
alias gameoff="sudo cpufreq-set -g powersave"
alias gameon="sudo cpufreq-set -g performance"


# --- even-better-ls ---  
# LS_COLORS=$(ls_colors_generator)
# run_ls() {
#         ls-i --color=auto --group-directories-first -w $(tput cols) "$@"
# }

# run_dir() {
#         dir-i --color=auto --group-directories-first -w $(tput cols) "$@"
# }

# run_vdir() {
#         vdir-i --color=auto --group-directories-first -w $(tput cols) "$@"
# }
# alias ls="run_ls"
# alias dir="run_dir"
# alias vdir="run_vdir"
# --- ---




# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
#(cat ~/.cache/wal/sequences &)


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


## workaround for handling TERM variable in multiple tmux sessions properly from http://sourceforge.net/p/tmux/mailman/message/32751663/ by Nicholas Marriott
#if [[ -n ${TMUX} && -n ${commands[tmux]} ]];then
#        case $(tmux showenv TERM 2>/dev/null) in
#                *256color) ;&
#                TERM=fbterm)
#                        TERM=screen-256color ;;
#                *)
#                        TERM=screen
#        esac
#fi


# If not running interactively, do not do anything
#[[ $- != *i* ]] && return
#[[ -z "$TMUX" ]] && exec tmux

# XRDM DIRS
# #export XRDM_DIR=~/.Xresource.d
#export XRDM_FONT_DIR=$XRDM_DIR/fonts
#export XRDM_COLOR_DIR=$XRDM_DIR/colors
#export XRDM_PRESET_DIR=$XRDM_DIR/presets
#export XRDM_PROGRAM_DIR=$XRDM_DIR/programs
#export XRDM_UPDATE=N

# Ueberzug Fix for tabbed (https://github.com/seebye/ueberzug/issues/80)
[ ! -z "$WINDOWID" ] && export UEBERZUG_USE_WINDOWID=1
