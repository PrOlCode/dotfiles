#!/bin/bash

set -e  # Остановить выполнение при ошибке
exec 2>install_errors.log  # Логирование ошибок

log_file="install.log"
exec > >(tee -a "$log_file")  # Дублируем вывод в файл

echo "=============================="
echo "  🚀 Начало установки"
echo "=============================="

# Проверка, запущен ли скрипт от root
if [[ $EUID -eq 0 ]]; then
  echo "❌ Этот скрипт не должен запускаться от root. Запустите без sudo."
  exit 1
fi

# Функция обработки ошибок
error_handler() {
  echo "❌ Ошибка! Подробности см. в install_errors.log" >&2
  exit 1
}
trap error_handler ERR  # Вызов функции при ошибке

# Обновление системы
echo "🔄 Обновление системы..."
sudo pacman -Syu --noconfirm
echo "✅ Обновление системы завершено."

# Проверка и установка yay (AUR helper)
install_yay() {
  if ! command -v yay &>/dev/null; then
    echo "🔧 yay не установлен. Устанавливаю yay..."
    sudo pacman -S --needed --noconfirm git base-devel

    TMP_DIR=$(mktemp -d)  # Создание временной папки
    git clone https://aur.archlinux.org/yay.git "$TMP_DIR/yay"
    cd "$TMP_DIR/yay"
    makepkg -si --noconfirm
    cd ~
    rm -rf "$TMP_DIR"
  else
    echo "✅ yay уже установлен."
  fi
}

install_yay

# Список программ для установки через pacman
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
  # geany
  git
  gitg
  gnome-disk-utility
  gthumb
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
  # pavucontrol
  # pycharm-community-edition
  python
  python-mutagen
  python-pip
  # pyright
  # qbittorrent
  ranger
  scrot
  # sqlitebrowser
  stow
  telegram-desktop
  # torbrowser-launcher
  tree
  tmux
  # ttf-jetbrains-mono-nerd
  unzip
  w3m			# for ranger
  wmctrl		# Control your EWMH compliant window manager from command line
  yt-dlp
  zed
  zip
  zsh
  # For NeoVim
  bottom
  gdu
  ripgrep
  tree-sitter-cli
)

# Список программ для установки через AUR с помощью yay
aur_packages=(
  # anydesk-bin
  google-chrome
  jdownloader2
  input-remapper-git
  lazydocker
  # microsoft-edge-stable-bin
  # thonny
  xkb-switch
  yandex-browser
  yandex-disk
  # zoom
)

# Функция для установки пакетов с помощью pacman
install_pacman_packages() {
  echo "📦 Установка пакетов из официальных репозиториев..."
  sudo pacman -S --needed --noconfirm "${pacman_packages[@]}"
  echo "✅ Установка pacman-пакетов завершена."
}

# Функция для установки пакетов из AUR с помощью yay
install_aur_packages() {
  echo "📦 Установка пакетов из AUR..."
  yay -S --needed --noconfirm "${aur_packages[@]}"
  echo "✅ Установка AUR-пакетов завершена."
}

# Выполнение установки
install_pacman_packages
install_aur_packages

echo "=============================="
echo "  🎉 Все пакеты установлены успешно!"
echo "=============================="

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
