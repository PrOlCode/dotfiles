#!/bin/bash

#  echo "Настроойка yandex-disk ----------------------------------------------------------------------" 
#  ln -s /home/Data/Yandex.Disk /home/olejon/Yandex.Disk
#
# # Путь к файлу
# file_path="$HOME/.config/yandex-disk/config.cfg"
# cp "$file_path" "${file_path}.bak"
#
# # Строки, которые нужно добавить
# new_lines='
# exclude-dirs="0_Inbox, Archive"'
#
# # Добавление строк в конец файла
# echo "$new_lines" >> "$file_path"
#
# # Проверка успешности записи
# if [ $? -eq 0 ]; then
#   echo "Строки успешно добавлены в файл $file_path."
# else
#   echo "Произошла ошибка при добавлении строк в файл $file_path." >&2
#   exit 1
# fi

# echo "Настроойка dotfiles ----------------------------------------------------------------------" 
# git clone git@github.com:PrOlCode/dotfiles.git
# cd dotfiles
# stow alacritty
# stow mpv
# stow nvim
# stow tmux
# cd ..

# echo "Настройка zsh ----------------------------------------------------------------------"
# chsh -s $(which zsh)
# echo "Установка Oh My Zsh..."
# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#
# # Путь к файлу
# file_path="$HOME/.zshrc"
# cp "$file_path" "${file_path}.bak"
#
# # Строки, которые нужно добавить
# new_lines='
# # Aliases
# alias act="source ./venv/bin/activate"
# alias c="clear"
# alias l="ls -lh"
# alias ll="ls -lah"
# alias rs="python manage.py runserver"
# alias t="tmux"
#
# export EDITOR="nvim"'
#
# # Добавление строк в конец файла
# echo "$new_lines" >> "$file_path"
#
# # Проверка успешности записи
# if [ $? -eq 0 ]; then
#   echo "Строки успешно добавлены в файл $file_path."
# else
#   echo "Произошла ошибка при добавлении строк в файл $file_path." >&2
#   exit 1
# fi

# echo "Настройка tmux ----------------------------------------------------------------------"
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# echo "Настройка alactitty ----------------------------------------------------------------------"
# mkdir -p ~/.config/alacritty/themes
# git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes

# echo "Настройка ranger ----------------------------------------------------------------------"
# ranger --copy-config=all
#
# # Путь к файлу
# file_dir="$HOME/.local/share/ranger"
# mkdir -p "$file_dir"
# file_path="$file_dir/bookmarks"
# touch "$file_path"
#
# # Строки, которые нужно добавить
# new_lines='
# a:/home/olejon/Yandex.Disk/IT/GPT
# c:/home/olejon/.config
# d:/home/olejon/Downloads
# e:/home/olejon/Yandex.Disk/English
# g:/home/olejon/git
# h:/home/olejon
# i:/home/olejon/Yandex.Disk/IT
# l:/home/olejon/.local
# n:/home/olejon/.config/nvim
# o:/home/olejon/Yandex.Disk/IT/Obsidian/Base
# p:/home/olejon/home/Data/MEGA/ГКПЧ
# y:/home/olejon/Yandex.Disk
# t:/home/olejon/.local/share/Trash'
#
# # Добавление строк в конец файла
# echo "$new_lines" >> "$file_path"
#
# # Проверка успешности записи
# if [ $? -eq 0 ]; then
#   echo "Строки успешно добавлены в файл $file_path."
# else
#   echo "Произошла ошибка при добавлении строк в файл $file_path." >&2
#   exit 1
# fi






