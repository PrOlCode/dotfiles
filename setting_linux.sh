#!/bin/bash

echo "alactitty ----------------------------------------------------------------------"
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes

echo "autoload ----------------------------------------------------------------------"
cp ~/dotfiles/autoload.desktop ~/.config/autostart

echo "tmux ----------------------------------------------------------------------"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "yandex-disk ----------------------------------------------------------------------" 
ln -s /home/Data/Yandex.Disk /home/olejon/Yandex.Disk

# Путь к файлу
file_path="$HOME/.config/yandex-disk/config.cfg"
cp "$file_path" "${file_path}.bak"

# Строки, которые нужно добавить
new_lines='
exclude-dirs="Archive"'

# Добавление строк в конец файла
echo "$new_lines" >> "$file_path"

# Проверка успешности записи
if [ $? -eq 0 ]; then
  echo "Строки успешно добавлены в файл $file_path."
else
  echo "Произошла ошибка при добавлении строк в файл $file_path." >&2
  exit 1
fi

echo "Настройка zsh ----------------------------------------------------------------------"
chsh -s $(which zsh)
echo "Установка Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Путь к файлу
file_path="$HOME/.zshrc"
cp "$file_path" "${file_path}.bak"

# Строки, которые нужно добавить
new_lines='
# Aliases
alias act="source ./venv/bin/activate"
alias c="clear"
alias rs="python manage.py runserver"
alias t="tmux"

export EDITOR="nvim"'

# Добавление строк в конец файла
echo "$new_lines" >> "$file_path"

# Проверка успешности записи
if [ $? -eq 0 ]; then
  echo "Строки успешно добавлены в файл $file_path."
else
  echo "Произошла ошибка при добавлении строк в файл $file_path." >&2
  exit 1
fi

echo "Настройка ranger ----------------------------------------------------------------------"
ranger --copy-config=all
mkdir -p ~/.local/share/ranger

# Путь к файлу
file_path="$HOME/.config/ranger/rc.conf"
cp "$file_path" "${file_path}.bak"

# Строка, которую нужно найти
search_string1="map dT console trash"
search_string2="set preview_images false"

# Строка, на которую нужно заменить
replace_string1="map dT shell gio trash %s"
replace_string2="set preview_images true"

# Выполнение замены строки в файле
sed -i "s/$search_string1/$replace_string1/g" "$file_path"
sed -i "s/$search_string2/$replace_string2/g" "$file_path"

# Проверка успешности выполнения замены
if [ $? -eq 0 ]; then
  echo "Строка успешно заменена в файле $file_path."
else
  echo "Произошла ошибка при замене строки в файле $file_path." >&2
  exit 1
fi

echo "Настроойка dotfiles ----------------------------------------------------------------------" 
git clone git@github.com:PrOlCode/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow alacritty
stow bin
stow mpv
stow nvim
stow ranger
stow tmux
