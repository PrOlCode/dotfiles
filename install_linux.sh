#!/bin/bash

echo "System update..."
sudo pacman -Syu --noconfirm

# Проверка, установлен ли yay (AUR helper)
if ! command -v yay &> /dev/null; then
  echo "yay не установлен. Устанавливаю yay..."
  sudo pacman -S --needed --noconfirm git base-devel
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
  cd ..
  sudo rm -rf yay
fi

# Список программ для установки через pacman
pacman_packages=(
  alacritty 
  atril
  bat       # clone cat
  base-devel
  bitwarden
  bottom
  brave-browser
  code
  docker
  fd
  fzf
  gdu
  # geany
  git
  gitg
  gnome-disk-utility
  # gthumb
  htop
  lazygit
  lf
  # libreoffice-still
  mate-calc
  mpv
  neofetch
  neovim
  npm
  obsidian
  # openoffice-bin 
  pavucontrol
  # pycharm-community-edition
  python
  python-mutagen
  python-pip
  pyright
  qbittorrent
  ranger
  ripgrep
  scrot
  sqlitebrowser
  stow
  telegram-desktop
  torbrowser-launcher
  tree
  tree-sitter-cli
  tmux
  ttf-jetbrains-mono-nerd
  unzip
  w3m       # for ranger
  wmctrl      # Control your EWMH compliant window manager from command line
  yt-dlp
  zip
  zsh
)

# Список программ для установки через AUR с помощью yay
aur_packages=(
  # anydesk-bin
  google-chrome
  jdownloader2
  input-remapper-git
  # microsoft-edge-stable-bin
  # thonny
  xkb-switch
  yandex-disk
  # zoom
)

# Функция для установки пакетов с помощью pacman
install_pacman_packages() {
  echo "Установка пакетов из официальных репозиториев..."
  sudo pacman -S --needed --noconfirm "${pacman_packages[@]}"
  
  if [ $? -eq 0 ]; then
    echo "--------------------------------------------------------------------------------------------------------------"
    echo "--------------------------------------------------------------------------------------------------------------"
    echo "Установка pacman-пакетов завершена успешно."
    echo "--------------------------------------------------------------------------------------------------------------"
    echo "--------------------------------------------------------------------------------------------------------------"
  else
    echo "Произошла ошибка при установке pacman-пакетов." >&2
    exit 1
  fi
}

# Функция для установки пакетов из AUR с помощью yay
install_aur_packages() {
  echo "Установка пакетов из AUR..."
  yay -S --needed --noconfirm "${aur_packages[@]}"
  
  if [ $? -eq 0 ]; then
    echo "--------------------------------------------------------------------------------------------------------------"
    echo "--------------------------------------------------------------------------------------------------------------"
    echo "Установка AUR-пакетов завершена успешно."
    echo "--------------------------------------------------------------------------------------------------------------"
    echo "--------------------------------------------------------------------------------------------------------------"
  else
    echo "Произошла ошибка при установке AUR-пакетов." >&2
    exit 1
  fi
}

# Выполнение установки
install_pacman_packages
install_aur_packages
echo "Все пакеты установлены успешно."

echo "Насройка git и ssh..."
git config --global user.name "Oleg Prikhodko" && git config --global user.email "4.oleg.pr@gmail.com"
ssh-keygen

echo "Далее данные из .ssh/id_rsa.pub добавляем в GitHub -> Settings -> SSH and GPG keys -> New SSH key..."
echo "Далее yandex-disk setup и настраиваем демон... и ОСТАНАВЛИВАЕМ ДЕМОН!!! path to dir: /home/Data/Yandex.Disk"
