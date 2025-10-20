if [ -f "$HOME/.cache/wal/color_starship.sh" ]; then
    . "$HOME/.cache/wal/color_starship.sh"
fi

if [[ $(tty) == "/dev/tty1" ]]; then
       Hyprland
fi 

export PATH="~/scripts:$PATH"
export EDITOR=nano
export VISUAL=nano
export ANDROID_HOME=/opt/android-sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

eval "$(starship init bash)"

alias config="nano ~/.config/hypr/hyprland.conf"
alias ls="ls --color=auto"
alias confwaybar="nano ~/.config/waybar/waybar.conf"
alias cp="cp -i"
alias df="df -h"
alias bye="exit"
alias fastfetch="misfortune | cowsay > /tmp/cowsay.txt && fastfetch --logo /tmp/cowsay.txt"
alias chs="navi"
alias btrfs-assistant="wsudo btrfs-assistant"
alias rcode="cd ~/Code/Lab\ 2/Root && root fit_grafico.cxx+"
alias reboot="backup && systemctl reboot"
alias backup="~/scripts/backup_bashrc.sh"

shopt -s expand_aliases
shopt -s histappend
shopt -s cdspell
shopt -s globstar
shopt -s autocd

HISTFILESIZE=1000
HISTFILESIZE=2000
