echo "installing base packages:"

PKGS=(
  'wayland'
  'xterm'
  'mesa'
  'hyprland'
  'networkmanager'
  'network-manager-applet'
  'ufw'
  'pipewire-jack'
  'pipewire'
  'pauvcontrol'
  'bluez'
  'bluez-libs'
  'bluez-firmware'
  'pulseaudio-bluetooth'
  'linux-lts'
  'android-sdk'
  'android-tools'
  'android-udev'
  'auto-cpufreq'
  'brightnessctl'
  'btop'
  'cmake'
  'fastfetch'
  'cowsay'
  'lolcat'
  'fakeroot'
  'firefox'
  'fzf'
  'gcc'
  'gnome-keyring'
  'grim'
  'gtk3'
  'gtk4'
  'hypridle'
  'hyprlock'
  'neovim'
  'kitty'
  'kwallet'
  'mesa-utils'
  'misfortune'
  'ninja'
  'obsidian'
  'otter-launcher'
  'powertop'
  'python'
  'sudo'
  'starship'
  'stow'
  'swaync'
  'thefuck'
  'unzip'
  'unrar'
  'wireplumber'
  'wlogout'
  'yay'
  'yazi'
  'xdg-utils'
)

  for PKG in "${PKGS[@]}"; do
    echo "Installing: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
  done

echo "Done"

cd $HOME
echo "Installing cloning github repo:"
curl "https://github.com/Deybraek1234/dotfiles"
cd dotfiles

cp -r .config $HOME/.config
cp .bashrc $HOME
cp scripts $HOME

echo "Done!"

