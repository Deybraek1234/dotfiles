if [ -f "$HOME/.cache/wal/color_starship.sh" ]; then
    . "$HOME/.cache/wal/color_starship.sh"
fi

if [[ $(tty) == "/dev/tty1" ]]; then
       Hyprland
fi 

export PATH="/usr/local/texlive/2025/bin/x86_64-linux:$PATH"

eval "$(starship init bash)"

alias config="nano ~/.config/hypr/hyprland.conf"
alias ls="ls --color=auto"
alias confwaybar="nano ~/.config/waybar/waybar.conf"
alias cp="cp -i"
alias df="df -h"
alias bye="exit"

shopt -s expand_aliases
shopt -s histappend
shopt -s cdspell
shopt -s globstar
shopt -s autocd

HISTFILESIZE=1000
HISTFILESIZE=2000


