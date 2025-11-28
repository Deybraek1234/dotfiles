if [ -f "$HOME/.cache/wal/color_starship.sh" ]; then
    . "$HOME/.cache/wal/color_starship.sh"
fi

if [[ $(tty) == "/dev/tty1" ]]; then
       Hyprland
fi 

export PATH="~/scripts:$PATH"
export EDITOR=nvim
export VISUAL=nvim
export ANDROID_HOME=/opt/android-sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:scripts
eval "$(starship init bash)"

alias config="$EDITOR ~/.config/hypr/hyprland.conf"
alias ls="ls --color=auto"
alias cp="cp -i"
alias df="df -h"
alias bye="exit"
#alias fastfetch="misfortune | cowsay > /tmp/cowsay.txt && fastfetch --logo /tmp/cowsay.txt"
alias chs="navi"
alias btrfs-assistant="wsudo btrfs-assistant"
alias rcode="cd ~/Code/Lab\ 2/Root && root fit_grafico.cxx+"
alias gpush="~/scripts/backup_git.sh && read -p 'Press anything to exit'"
alias reboot="gpush && systemctl reboot"
alias gpull="~/scripts/restore_git.sh && read -p 'Press anything to exit'"
alias fabric="python -m fabric"
alias usb_mount="sudo mount /dev/sda1 /mnt/usb -o rw,uid=1000,gid=1000,umask=000 && cd /mnt/usb"
alias usb_umount="cd $HOME && sudo umount /mnt/usb"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias nv="nvim"
alias sleep="systemctl sleep & bye"

shopt -s expand_aliases
shopt -s histappend
shopt -s cdspell
shopt -s globstar
shopt -s autocd

HISTFILESIZE=1000
HISTFILESIZE=2000

eval "$(thefuck --alias)"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
