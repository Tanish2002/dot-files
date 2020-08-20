zimfw() { source /home/weeb/.config/zsh/.zim/zimfw.zsh "${@}" }
fpath=(/home/weeb/dot-files/xmonad_solid/.config/zsh/.zim/modules/utility/functions ${fpath})
autoload -Uz mkcd mkpw
source /home/weeb/dot-files/xmonad_solid/.config/zsh/.zim/modules/environment/init.zsh
source /home/weeb/dot-files/xmonad_solid/.config/zsh/.zim/modules/input/init.zsh
source /home/weeb/dot-files/xmonad_solid/.config/zsh/.zim/modules/utility/init.zsh
source /home/weeb/dot-files/xmonad_solid/.config/zsh/.zim/modules/zsh-completions/zsh-completions.plugin.zsh
source /home/weeb/dot-files/xmonad_solid/.config/zsh/.zim/modules/completion/init.zsh
source /home/weeb/dot-files/xmonad_solid/.config/zsh/.zim/modules/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/weeb/dot-files/xmonad_solid/.config/zsh/.zim/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/weeb/dot-files/xmonad_solid/.config/zsh/.zim/modules/powerlevel10k/powerlevel10k.zsh-theme
