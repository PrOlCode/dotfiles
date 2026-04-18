#!/bin/bash

# Устанвливаемые пакеты через pacman
pacman_packages=(
  alacritty 
  atril
  # bat			# clone cat
  baobab		# disk analyzer
  base-devel
  bitwarden
  brave-browser
  code
  docker
  docker-compose
  fd
  fzf
  geany
  git
  gitg
  gnome-disk-utility
  gthumb
  htop
  lazygit
  lf
  # libreoffice-still
  # libreoffice-still-ru
  maim
  mate-calc
  mpv
  neofetch
  neovim
  npm
  obsidian
  okular
  # openoffice-bin 
  # pycharm-community-edition
  python
  python-mutagen
  python-pip
  # pyright
  qbittorrent
  ranger
  # scrot
  
  # sqlitebrowser
  stow
  telegram-desktop
  torbrowser-launcher
  tree
  tmux
  ttf-jetbrains-mono-nerd
  ueberzugpp	# for ranger
  unzip
  wireguard-tools
  wmctrl		# Control your EWMH compliant window manager from command line
  xclip
  # xdotools
  yt-dlp
  zed
  zip
  zsh
  # For NeoVim
  bottom
  gdu
  ripgrep
  tree-sitter-cli
  vim-spell-ru
)

# Устанвливаемые пакеты через yay (AUR)
aur_packages=(
  alacritty-theme-switcher
  # anydesk-bin
  dupeguru
  google-chrome
  jdownloader2
  input-remapper
  lazydocker
  # microsoft-edge-stable-bin
  # thonny
  simplescreenrecorder
  xkb-switch
  yandex-browser
  yandex-disk
  zoom
)

set -euo pipefail

# Файл для логирования ошибок
LOGFILE="install_errors.log"

# Функция для логирования ошибок и завершения скрипта
error_exit() {
  echo "❌ Ошибка на строке ${1:-"unknown"}. Подробности в $LOGFILE"
  exit 1
}

# Ловим любые ошибки и вызываем error_exit
trap 'error_exit $LINENO' ERR

echo "========================================"
echo "Установка пакетов через pacman..."
sudo pacman -S --needed --noconfirm "${pacman_packages[@]}" 2>> "$LOGFILE" || error_exit $LINENO

# Проверка и установка yay (AUR helper)
if ! command -v yay &> /dev/null; then
  echo "========================================"
  echo "yay не найден. Устанавливаю yay..."
  # Устанавливаем необходимые пакеты для сборки yay
  sudo pacman -S --needed --noconfirm git base-devel 2>> "$LOGFILE" || error_exit $LINENO

  TMP_DIR=$(mktemp -d) || error_exit $LINENO
  git clone https://aur.archlinux.org/yay.git "$TMP_DIR/yay" 2>> "$LOGFILE" || error_exit $LINENO
  cd "$TMP_DIR/yay" || error_exit $LINENO
  makepkg -si --noconfirm 2>> "$LOGFILE" || error_exit $LINENO
  cd ~ || error_exit $LINENO
  rm -rf "$TMP_DIR" || error_exit $LINENO
else
  echo "========================================"
  echo "yay уже установлен."
fi

echo "========================================"
echo "Установка пакетов через yay (AUR)..."
yay -Syu --noconfirm "${aur_packages[@]}" 2>> "$LOGFILE" || error_exit $LINENO
yay -S --needed --noconfirm "${aur_packages[@]}" 2>> "$LOGFILE" || error_exit $LINENO

echo "========================================"
echo "🎉 Все пакеты успешно установлены!"

# Настройка Git и SSH
echo "🔑 Настройка Git и SSH..."
git config --global user.name "Oleg Prikhodko"
git config --global user.email "4.oleg.pr@gmail.com"

SSH_KEY_PATH="$HOME/.ssh/id_rsa"

if [[ -f "$SSH_KEY_PATH" ]]; then
  echo "✅ SSH-ключ уже существует: $SSH_KEY_PATH"
else
  ssh-keygen -t rsa -b 4096 -f "$SSH_KEY_PATH" -N ""
  echo "✅ SSH-ключ создан: $SSH_KEY_PATH"
  echo "📌 Далее добавьте ключ в GitHub -> Settings -> SSH and GPG keys -> New SSH key"
  cat "$SSH_KEY_PATH.pub"
fi

echo "Далее данные из .ssh/id_rsa.pub добавляем в GitHub -> Settings -> SSH and GPG keys -> New SSH key..."
echo "Далее yandex-disk setup и настраиваем демон... и ОСТАНАВЛИВАЕМ ДЕМОН!!! path to dir: /home/Data/Yandex.Disk"
