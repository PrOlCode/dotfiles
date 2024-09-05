# УСТАНОВКА

==update system and install programm:==
```
install_linux.sh
```

==downloads dotfiles:==
```
git clone git@github.com:PrOlCode/dotfiles.git ~/dotfiles
```

```
cd ~/dotfiles
stow bin
stow mpv
stow nvim
cp ~/dotfiles/autoload-olj.desktop ~/.config/autostart
```

==alactitty:==
```
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
stow alacritty
```

==ranger:==
```
ranger --copy-config=all
mkdir -p ~/.local/share/ranger
```

Переопределяем удаление в корзину и предпросмотр изображений:
```
cp ~/.config/ranger/rc.conf ~/.config/ranger/rc.conf.bak
sed -i 's/map dT console trash/map dT shell gio trash %s/g' ~/.config/ranger/rc.conf
sed -i 's/set preview_images false/set preview_images true/g' ~/.config/ranger/rc.conf
```

```
cp ~/.config/ranger/rifle.conf ~/.config/ranger/rifle.conf.bak
nvim ~/.config/ranger/rifle.conf
```

add in part # Scripts (line 110):
```
ext lua = nvim -- "$@"
```

```
nvim ~/.local/share/ranger/bookmarks
```

```
c:/home/olejon/.config
d:/home/olejon/Downloads
e:/home/olejon/Yandex.Disk/English
g:/home/olejon/git
h:/home/olejon
i:/home/olejon/Yandex.Disk/IT
l:/home/olejon/.local
n:/home/olejon/.config/nvim
o:/home/olejon/Yandex.Disk/IT/Obsidian/Base
p:/home/olejon/home/Data/MEGA/ГКПЧ
y:/home/olejon/Yandex.Disk
t:/home/olejon/.local/share/Trash
```

==zsh:==
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv ~/.zshrc ~/.zshrc.bak
stow zsh
```

```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```












==tmux:==
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
stow tmux
```

```
pane	0	1	0	:-	0	man	:/home/olejon/Downloads	1	zsh	:
pane	0	2	0	:	0	man	:/home/olejon	1	zsh	:
pane	0	2	0	:	1	man	:/home/olejon	0	zsh	:
pane	0	2	0	:	2	man	:/home/olejon	0	zsh	:
pane	0	3	1	:*	0	[No Name] - NVIM	:/home/Data/Yandex.Disk/IT/Obsidian/Base	1	nvim	:nvim
pane	0	4	0	:	0	man	:/home/olejon/Downloads	1	zsh	:
pane	0	5	0	:	0	man	:/home/olejon/Downloads	1	zsh	:
window	0	1	:ranger	0	:-	cc3e,174x38,0,0,1	off
window	0	2	:bash	0	:	84bf,174x38,0,0{87x38,0,0,2,86x38,88,0[86x19,88,0,3,86x18,88,20,4]}	off
window	0	3	:obsidian	1	:*	cc42,174x38,0,0,5	off
window	0	4	:zsh	0	:	cc43,174x38,0,0,6	:
window	0	5	:zsh	0	:	cc44,174x38,0,0,7	:
state	0	
```

==yandex-disk:==
```
ln -s /home/Data/Yandex.Disk /home/olejon/Yandex.Disk
cp ~/.config/yandex-disk/config.cfg ~/.config/yandex-disk/config.cfg.bak
nvim ~/.config/yandex-disk/config.cfg
```

```
exclude-dirs="Archive"
```

==go:==

```
go install golang.org/x/tools/gopls@latest
```

## Общее

Полезные команды:
```
pacman -Ss <package_name>pac => поиск пакета
pacman -S <package_name>pac => установка пакета
pacman -Rns <package_name> => удаление пакета
```

Добавление пользователя:
```
sudo useradd -m galinushka
sudo passwd galinushka
```

## Программы

Версия ядра:
```
uname -r
```

```
sudo pacman -S virtualbox
```

---

???LIB:
???speech-dispatcher

???sqlitestudio (https://sqlitestudio.pl/)
???https://mega.io/desktop#download (MEGA)
???keymapper (AUR)
???simplescreenrecorder (AUR)
???intellij-idea-community-edition
???goldendict - Need programm but not in pacman and pamac
???networkmanager-openvpn
???wireguard

## Сочетания клавиш

- Settings manager => Power Manager => Display => Display power managment = off
- Xfce screensaver = off

- Alt + Q -> Close Window
- Super + Вверх -> Maximize Window
- Настраиваем WorkSpace Settings и назначаем переход по рабочим пространствам: Ctrl + 1-5
- Настраиваем Move window to workspace 1-5: Shift + Super + 1-5
- Настраиваем left workspace: Ctrl+ Alt + h
- Настраиваем right workspace: Ctrl + Alt + l

- Ctrl + Alt + C -> `mate-calc`
- Ctrl + Shift + T -> `alacritty`
- Ctrl + Shift + G -> `google-chrome-stable`
- Ctrl + Shift + B -> `obsidian`
- Ctrl + Shift + W -> `brave`
- PrtSc -> `scrot`
- Ctrl + PrtSc -> `scrot -s`

- Settings => Mouse and Touchpad => Devices => input remapper... => Pointer speed = 8.0
- Settings => Keyboard => Repeat delay = 350 && Repeat speed = 50

- отключаем проверку обновлений
- меняем зеркало
- включаем AUR

Просмотр текущего списка зеркал:
```
sudo pacman-mirrors --status
```

Ручной выбор зеркал:
```
sudo nano /etc/pacman.d/mirrorlist
```

Получение актуального списка зеркал и их сортировка по скорости:
```
sudo pacman-mirrors --fasttrack
```

Выбор зеркал на основе вашего географического положения:
```
sudo pacman-mirrors --geoip
```

Применение изменений:
```
sudo pacman -Syyu
```

## Звук на передней панели

sudo nano /usr/share/pulseaudio/alsa-mixer/paths/analog-output-lineout.conf 

Блок `Element Desktop` ставим в положение `on`.

[Element Headphone]
switch = on
volume = on

[Element Headphone,1]
switch = off
volume = off

[Element Headphone2]
switch = off
volume = off

[Element Speaker]
switch = off
volume = off

[Element Desktop Speaker]
switch = off
volume = off

## Arch (-)

## Manjaro (xfce)

Убираем проверки обновлений (ставим каждую неделю)

Удаляем vlc:
```
sudo pacman -Rns vlc
```

Отключаем системный динамик (beep-er):
```
echo "blacklist pcspkr" | sudo tee -a /etc/modprobe.d/blacklist-pcspkr.conf
```

## Artix Linux (xfce)

Устанавливаем программы:

```
sudo pacman -S docker firefox htop mc neovim npm python python-pip ranger telegram-desktop tree tmux unzip zip zsh??? --noconfirm
```

```
yay -S yandex-disk
```

yay -S thonny ???

---

Качаем AppImages:

obsidian:

```
https://obsidian.md/download
```

bitwarden:

```
https://bitwarden.com/download/
```

## Archbang (i3)

## Ubuntu

```
sudo apt-get update && sudo apt-get upgrade -y
```

## i3

`Mod + Shift + R` - reload configurations
`Shift + Mod + E` - exit from i3
`Mod + Enter` - terminal
`Mod + d` - dMenu
`Mod + f` - full screen

Mod + W — это разделяет
10:51
эти панели и объединяет их
10:53
во вкладки, так что я могу нажать Mod + Влево/Вправо,
10:56
и каждое окно будет полноэкранным,
10:58
но они собраны во вкладки,
11:00
так что между ними легко переключаться.

Mod + E переключает ориентацию панели,
11:13
она меняется с вертикального разделения на
11:14
горизонтальное разделение, т

Теперь отсюда я могу выбрать родителя,
11:21
которым является всё окно целиком, с помощью Mod + A.

Shift + Mod + Space — это
11:52
превратит окно в плавающее, а если
11:54
нажмём Shift + Mod + Space ещё раз, оно
11:56
вернётся в полноэкранный режим, нормальный режим,












sudo pacman -S alactitty dmenu




```
yay -Ss ttf-meslo-nerd
```

```
fc-list | grep Meslo
```

```
yay -S picom polybar feh rofi
```

```

```



















# НАСТРОЙКА

## SWAP

Просмотр разделов:
```
lsblk
```

```
sudo fdisk -l
```

Форматирование раздела: 
```
sudo mkswap /dev/sda6
```

Включение раздела:
```
sudo swapon /dev/sda6
```

Чтобы сделать swap раздел или файл постоянно подключенным при загрузке системы:
```
sudo nvim /etc/fstab
```

и добавить туда:
```
/dev/sda6 none swap sw 0 0
```

Проверить свою конфигурацию swap:
```
swapon --show
```

или
```
free -h
```

## Fonts

Ставим Nerd Fonts ( https://www.nerdfonts.com/font-downloads ):
```
mkdir -p ~/.local/share/fonts
```

```
unzip JetBrainsMono.zip -d JetBrainsMono
```

```
mv JetBrainsMono ~/.local/share/fonts/
```

```
fc-cache -f -v
```

```
fc-list | grep "JetBrainsMono"
```

---
https://github.com/ranger/ranger
https://wiki.archlinux.org/title/Ranger

## NeoVim

Delete:
```
rm -rf ~/.config/nvim \
~/.local/share/nvim \
~/.local/state/nvim \
~/.cache/nvim
```

```
mkdir /home/olejon/.config/nvim
cp -r /home/olejon/git/dotfiles/nvim/* /home/olejon/.config/nvim/
```

Backup:
```
rm -rf ~/.config/nvim.vim
rm -rf ~/.local/share/nvim.vim
rm -rf ~/.local/state/nvim.vim
rm -rf ~/.cache/nvim.vim
mv ~/.config/nvim ~/.config/nvim.vim
mv ~/.local/share/nvim ~/.local/share/nvim.vim
mv ~/.local/state/nvim ~/.local/state/nvim.vim
mv ~/.cache/nvim ~/.cache/nvim.vim
```

Restore:
```
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
mv ~/.config/nvim.vim ~/.config/nvim
mv ~/.local/share/nvim.vim ~/.local/share/nvim
mv ~/.local/state/nvim.vim ~/.local/state/nvim
mv ~/.cache/nvim.vim ~/.cache/nvim
```

LSP:
```
MasonInstall lua-language-server gopls pyright marksman
```

Linters:
```
MasonInstall selene golangci-lint pylint markdownlint
```

Formatters:
```
MasonInstall stylua golines black prettier
```

Lua:
```
MasonInstall lua-language-server selene stylua
```

Go:
```
MasonInstall gopls golangci-lint black
```

Python:
```
MasonInstall pyright pylint black
```

Markdown:
```
MasonInstall marksman markdownlint prettier
```

---

Пользовательские плагины:

`Переключение раскладки:
https://github.com/ivanesmantovich/xkbswitch.nvim

---

`:source %` - выполняет содержимое текущего открытого файла как скрипт. Это полезно для быстрого применения изменений в конфигурационном файле или любом другом скриптовом файле, без необходимости перезапускать Neovim. Например, если вы редактируете файл `init.lua` и хотите сразу применить изменения, вы можете использовать `:source %`.

---

==TypeCraft==
https://www.typecraft.dev/
https://learn.typecraft.dev/courses/

Lesson 1: 
https://github.com/folke/lazy.nvim
https://github.com/catppuccin/catppuccin
https://github.com/nvim-telescope/telescope.nvim
https://github.com/nvim-treesitter/nvim-treesitter

Lesson 2: 
https://github.com/nvim-neo-tree/neo-tree.nvim
-- https://github.com/nvim-tree/nvim-tree.lua
https://github.com/nvim-lualine/lualine.nvim

Lesson 3: 
https://github.com/williamboman/mason.nvim
https://github.com/williamboman/mason-lspconfig.nvim
https://github.com/neovim/nvim-lspconfig
https://github.com/nvim-telescope/telescope-ui-select.nvim

Lesson 4: 
-- https://github.com/jose-elias-alvarez/null-ls.nvim
https://github.com/nvimtools/none-ls.nvim

Lesson 5: 
https://github.com/hrsh7th/nvim-cmp
https://github.com/L3MON4D3/LuaSnip
https://github.com/saadparwaiz1/cmp_luasnip
https://github.com/rafamadriz/friendly-snippets
https://github.com/hrsh7th/cmp-nvim-lsp

Lesson 6:
https://github.com/mfussenegger/nvim-dap
https://github.com/rcarriga/nvim-dap-ui
https://github.com/leoluz/nvim-dap-go





---
https://neovim.io/
https://github.com/nanotee/nvim-lua-guide

## AstroNvim

Backup:
```
rm -rf ~/.config/nvim.astro
rm -rf ~/.local/share/nvim.astro
rm -rf ~/.local/state/nvim.astro
rm -rf ~/.cache/nvim.astro
mv ~/.config/nvim ~/.config/nvim.astro
mv ~/.local/share/nvim ~/.local/share/nvim.astro
mv ~/.local/state/nvim ~/.local/state/nvim.astro
mv ~/.cache/nvim ~/.cache/nvim.astro
```

Restore:
```
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
mv ~/.config/nvim.astro ~/.config/nvim
mv ~/.local/share/nvim.astro ~/.local/share/nvim
mv ~/.local/state/nvim.astro ~/.local/state/nvim
mv ~/.cache/nvim.astro ~/.cache/nvim
```




Delete:
```
rm -rf ~/.config/nvim \
~/.local/share/nvim \
~/.local/state/nvim \
~/.cache/nvim
```

Install:
```
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
rm -rf ~/.config/nvim/.git
nvim
```

---

https://github.com/sergei-mironov/xkb-switch



!!!
https://vi.stackexchange.com/questions/84/how-can-i-copy-text-to-the-system-clipboard-from-vim

READ (buffers):

https://github.com/ibhagwan/fzf-lua
https://github.com/akinsho/bufferline.nvim
https://github.com/wincent/command-t
https://github.com/nvim-telescope/telescope.nvim

https://github.com/t9md/vim-choosewin
https://github.com/akinsho/bufferline.nvim
https://github.com/romgrk/barbar.nvim

READ (Russian languages )

https://neovim.io/doc/user/russian.html
https://neovim.io/doc/user/options.html#'keymap
https://neovim.io/doc/user/map.html#%3Amap
https://neovim.io/doc/user/options.html#'langmap

---

Добавляем установку плагина с github в файл `/plugins/user.lua`:
https://github.com/fatih/vim-go

---

```
-- Установка langmap для поддержки русской раскладки
vim.opt.langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

-- Настройка горячих клавиш для выхода из режима вставки
vim.api.nvim_set_keymap('i', 'оо', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'ол', '<ESC>', {noremap = true, silent = true})
```

---

Arch:

```
go install github.com/go-delve/delve/cmd/dlv@latest
```

---

Change in mappings.lua: delete comments in point '-- navigate buffer tabs with `H` and `L`'


---
https://docs.astronvim.com/
https://github.com/AstroNvim/AstroNvim

## LazyVim

Backup:
```
rm -rf ~/.config/nvim.lazy
rm -rf ~/.local/share/nvim.lazy
rm -rf ~/.local/state/nvim.lazy
rm -rf ~/.cache/nvim.lazy
mv ~/.config/nvim ~/.config/nvim.lazy
mv ~/.local/share/nvim ~/.local/share/nvim.lazy
mv ~/.local/state/nvim ~/.local/state/nvim.lazy
mv ~/.cache/nvim ~/.cache/nvim.lazy
```

Restore:
```
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
mv ~/.config/nvim.lazy ~/.config/nvim
mv ~/.local/share/nvim.lazy ~/.local/share/nvim
mv ~/.local/state/nvim.lazy ~/.local/state/nvim
mv ~/.cache/nvim.lazy ~/.cache/nvim
```

Install:
```
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
nvim
```


---
https://www.lazyvim.org/
https://lazy.folke.io/installation

## LunarVim

Backup:
```
rm -rf ~/.config/nvim.lunar
rm -rf ~/.local/share/nvim.lunar
rm -rf ~/.local/state/nvim.lunar
rm -rf ~/.cache/nvim.lunar
mv ~/.config/nvim ~/.config/nvim.lunar
mv ~/.local/share/nvim ~/.local/share/nvim.lunar
mv ~/.local/state/nvim ~/.local/state/nvim.lunar
mv ~/.cache/nvim ~/.cache/nvim.lunar
```

Restore:
```
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
mv ~/.config/nvim.lunar ~/.config/nvim
mv ~/.local/share/nvim.lunar ~/.local/share/nvim
mv ~/.local/state/nvim.lunar ~/.local/state/nvim
mv ~/.cache/nvim.lunar ~/.cache/nvim
```

Install:
```
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
```

Uninstall:
```
bash ~/.local/share/lunarvim/lvim/utils/installer/uninstall.sh
```

---
https://www.lunarvim.org/

## NvChad

Backup:
```
rm -rf ~/.config/nvim.chad
rm -rf ~/.local/share/nvim.chad
rm -rf ~/.local/state/nvim.chad
rm -rf ~/.cache/nvim.
mv ~/.config/nvim ~/.config/nvim.chad
mv ~/.local/share/nvim ~/.local/share/nvim.chad
mv ~/.local/state/nvim ~/.local/state/nvim.chad
mv ~/.cache/nvim ~/.cache/nvim.chad
```

Restore:
```
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
mv ~/.config/nvim.chad ~/.config/nvim
mv ~/.local/share/nvim.chad ~/.local/share/nvim
mv ~/.local/state/nvim.chad ~/.local/state/nvim
mv ~/.cache/nvim.chad ~/.cache/nvim
```

Install:
```
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
```

---
https://nvchad.com/

## Google chrome

1. Синхронизация + подключение второй учетной записи

2. Page zoom -> 110

3. https://ru.savefrom.net/ -> Установите скрипт SaveFrom.net Helper

---

Video Speed Controller:

```
Show/hide controller: H/0
Decrease speed: D/0.1
Increase speed: E/0.1
Rewind: A/10
Advance: G/10
Reset speed: S/1
Preferred speed: W/2
Rewind: Z/3
Advance: V/3
```

---

Brave extension

```
bitwarden
dark reader
deepl
# Google Translate
EverSync
# I don't care about cookies
# OneTab
# Reverso
# Toggl Track
# Video Speed Controller
# YouTube Summary with ChatGPT
UnDistracted
# YouTube Summary with ChatGPT & Claude
```

YouTube Summary with ChatGPT & Claude:

```
Summarize the following in 5 bullet points. Answer in Russian.
Summarize this information. Answer in Russian.
```

```
What are the main takeaways from the following?
Describe in great detail. Answer in Russian.
```

Settings

```
Get startes => New Tab Page => New tab page show = blank page

Content => Page zoom = 110%

Search engine => Google

Languages => Brave Translate (set off)

# Privacy and security => Privacy and security => Site and Shields Settings => Additional permissions => Clipboard = off

Privacy and security => Privacy and security => Site and Shields Settings =>  Notifications => Don't allow sites to send notifications
```

## Pycharm

Settings -> Editor -> Font: JetBrains Mono NL / 18 / 1.1
Settings -> Plugins -> IdeaVim

```
nano ~/.ideavimrc
```

```
inoremap jk <esc>
```

## Настройка переназначения клавиши

**Вариант 1**

```
sudo systemctl enable input-remapper
```

```
sudo systemctl restart input-remapper
```

```
Autoload = On
+ Add => Record

Type = Key or Macro
KEY_PAGEUP
KEY_PAGEDOWN

Apply
```

---
https://github.com/sezanzeb/input-remapper

**Вариант 2**

```
nvim ~/.config/keymapper.conf
```

Добавляем в конфигурацию:
```
MetaRight >> ControlRight
MetaLeft >> ControlLeft
ControlLeft >> MetaLeft
```

Запуск службы при старте системы:
```
sudo systemctl enable keymapperd
```

Прописываем автоматический запуск приложения
```
keymapper
```

---
https://github.com/houmain/keymapper

## Mega

Качает приложение: https://mega.io/ru/desktop#downloadapps

Download the package and, in a terminal, install it with:
```
sudo pacman -U /home/olejon/Downloads/megasync-x86_64.pkg.tar.zst
```

## Anki

Версия QT:
```
qmake-qt5 --version && qmake-qt6 --version
```

Если не установлено, то ставим:
```
sudo pacman -S qt5-base
```

Качаем приложение соответствующей версии: https://apps.ankiweb.net/

Разархивируйте файл с помощью команды:
```
tar -I zstd -xvf 
```

Перейти в каталог и выполнить:
```
sudo ./install.sh
```

---

Front Template:

```
{{Front}}
```

Back Template:

```
<a href="https://translate.google.ru/?hl=ru&tab=wT&sl=en&tl=ru&text={{Front}}&op=translate">google</a>  
&nbsp;&nbsp;&nbsp;  
<a href="https://www.google.com/search?q={{Front}}+meaning">google_mean</a>  
<br><br>  
<a href="https://translate.yandex.ru/?source_lang=en&target_lang=ru&text={{Front}}">yandex</a>  
&nbsp;&nbsp;&nbsp;  
<a href="https://context.reverso.net/translation/english-russian/{{Front}}">reverso</a>  
<br><br>  
<a href="https://www.ldoceonline.com/dictionary/{{Front}}">longman</a>  
&nbsp;&nbsp;&nbsp;  
<a href="https://www.oxfordlearnersdictionaries.com/us/definition/english/{{Front}}">oxford</a>  
<br><br>  
<a href="https://dictionary.cambridge.org/dictionary/english/{{Front}}">cambridge</a>  
&nbsp;&nbsp;&nbsp;  
<a href="https://www.merriam-webster.com/dictionary/{{Front}}">merriam</a>  
<br><br>  
<a href="https://www.collinsdictionary.com/dictionary/english/{{Front}}">collins</a>  
&nbsp;&nbsp;&nbsp;  
<a href="https://www.dictionary.com/browse/{{Front}}">dictionary</a>  
<br><br>  
<a href="https://www.lingvolive.com/ru-ru/translate/en-ru/{{Front}}">lingvo</a>  
&nbsp;&nbsp;&nbsp;  
<a href="https://www.etymonline.com/search?q={{Front}}">etymonline</a>  
  
<hr>  
  
<a href="https://www.google.com/search?q={{Front}}&tbm=isch">google_img</a>  
&nbsp;&nbsp;&nbsp;  
<a href="https://yandex.kz/images/search?from=tabbar&text={{Front}}">ya_img</a>  
&nbsp;&nbsp;&nbsp;  
<a href="https://youglish.com/pronounce/{{Front}}/english/us">pronounce</a>  
  
<br><br>  
  
<a href="#" id="option1_links">option1_links</a>  
&nbsp;&nbsp;&nbsp;  
<a href="#" id="option2_links">option2_links</a>  
&nbsp;&nbsp;&nbsp;  
<a href="#" id="all_links">all_links</a>  
  
<script>  
    document.getElementById('option1_links').addEventListener('click', function (e) {  
        e.preventDefault();  
        window.open('https://context.reverso.net/translation/english-russian/{{Front}}');  
        window.open('https://www.ldoceonline.com/dictionary/{{Front}}');  
        window.open('https://www.merriam-webster.com/dictionary/{{Front}}');  
        window.open('https://www.lingvolive.com/ru-ru/translate/en-ru/{{Front}}');  
        window.open('https://www.google.com/search?q={{Front}}+meaning&tbm=isch');  
        window.open('https://youglish.com/pronounce/{{Front}}/english/us');  
    });  
  
    document.getElementById('option2_links').addEventListener('click', function (e) {  
        e.preventDefault();  
        window.open('https://www.google.com/search?q={{Front}}+meaning');  
        window.open('https://context.reverso.net/translation/english-russian/{{Front}}');  
        window.open('https://www.ldoceonline.com/dictionary/{{Front}}');  
        window.open('https://www.oxfordlearnersdictionaries.com/us/definition/english/{{Front}}');  
        window.open('https://www.dictionary.com/browse/{{Front}}');  
        window.open('https://dictionary.cambridge.org/dictionary/english/{{Front}}');  
        window.open('https://www.lingvolive.com/ru-ru/translate/en-ru/{{Front}}');  
        window.open('https://www.etymonline.com/search?q={{Front}}');  
        window.open('https://www.google.com/search?q={{Front}}+meaning&tbm=isch');  
        window.open('https://youglish.com/pronounce/{{Front}}/english/us');  
    });  
  
    document.getElementById('all_links').addEventListener('click', function (e) {  
        e.preventDefault();  
        window.open('https://translate.google.ru/?hl=ru&tab=wT&sl=en&tl=ru&text={{Front}}&op=translate');  
        window.open('https://www.google.com/search?q={{Front}}+meaning');  
        window.open('https://translate.yandex.ru/?source_lang=en&target_lang=ru&text={{Front}}');  
        window.open('https://context.reverso.net/translation/english-russian/{{Front}}');  
        window.open('https://www.ldoceonline.com/dictionary/{{Front}}');  
        window.open('https://www.oxfordlearnersdictionaries.com/us/definition/english/{{Front}}');  
        window.open('https://dictionary.cambridge.org/dictionary/english/{{Front}}');  
        window.open('https://www.merriam-webster.com/dictionary/{{Front}}');  
        window.open('https://www.collinsdictionary.com/dictionary/english/{{Front}}');  
        window.open('https://www.dictionary.com/browse/{{Front}}');  
        window.open('https://www.lingvolive.com/ru-ru/translate/en-ru/{{Front}}');  
        window.open('https://www.etymonline.com/search?q={{Front}}');  
        window.open('https://www.google.com/search?q={{Front}}+meaning&tbm=isch');  
        window.open('https://yandex.kz/images/search?from=tabbar&text={{Front}}+meaning');  
        window.open('https://youglish.com/pronounce/{{Front}}/english/us');  
    });  
</script>  
  
<hr>  
  
{{FrontSide}}  
  
<hr id=answer>  
  
<div class="word">{{Back}}</div>
```

Styling:

```
.card {
    font-family: arial;
    font-size: 20px;
    text-align: center;
    color: black;
    background-color: darkgray;
}

.word {
    font-family: arial;
    font-size: 20px;
    text-align: left;
    color: black;
    background-color: darkgray;
}
```

---

SETTING:

```
Add-ons:
- Review HeatMap
- Reset Review Stats
- Anki Simulator
- AwesomeTTS - Add speech to you flashcards
```

```
Daily Limits:
- New cards/day = 100
- Maximum review/day = 9999
```

```
New Cards: 
- Learning steps: 15m 1d 3d
- Graduating interval: 6
- Easy interval: 8
```

```
Lapses:
- Relearning steps: 20m 1d
- Minimum interval: 3
- Leech threshold: 8
```

```
Display Order:
- New/Review order: Show after reviews
- Interday learning/review order: Show after reviews
```

```
Advanced:
- Maximum interval: 240
- Starting ease: 2.5
- Easy bonus: 1.3
- Interval modifier: 1.0
- Hard interval: 1.2
- New interval: 0.2
```

## Docker

1. Остановите Docker: `systemctl stop docker`.
2. Откройте файл `/etc/docker/daemon.json` в текстовом редакторе. Если файл не существует, создайте его.
3. Добавьте следующее содержимое, заменив `/new/path` на желаемый путь:
```
{
    "data-root": "/new/path"
}
```
4. Переместите содержимое текущего каталога хранения Docker (по умолчанию это `/var/lib/docker`) в новое местоположение: `mv /var/lib/docker /new/path`.
5. Сохраните файл и запустите Docker снова: `systemctl start docker`.

## Автостарт приложений

Проверяем запускаемые программы и настройки:
```
nvim ~/.local/bin/autoload.sh
```

# СПРАВКА

## DotFiles

View videos:
https://www.youtube.com/@teej_dv/videos

Dotfiles:

https://github.com/josean-dev/dev-environment-files
https://github.com/craftzdog/dotfiles-public
https://github.com/antgubarev/dotfiles
https://github.com/0xAquaWolf/AquaFiles
https://github.com/nvim-lua/kickstart.nvim
https://github.com/typecraft-dev/dotfiles
https://github.com/itxor/go-rust-nvim-config
https://github.com/linkarzu/dotfiles-latest
https://github.com/Tunkert/neovim-config
https://github.com/folke/dot
https://github.com/ThePrimeagen/init.lua
https://github.com/elliottminns/dotfiles
https://gitlab.com/Clsmith1/dotfiles
https://gitlab.com/prolinux410/owl_dots/-/tree/main/i3wm/i3_one
https://gitlab.com/manzhara157/i3bygamerua
https://github.com/nvim-lua/kickstart.nvim

## Очистка pacman

Чтобы очистить Manjaro Linux от ненужных пакетов, вы можете воспользоваться утилитой Pacman, которая является менеджером пакетов в Manjaro.

1. Обновите список доступных пакетов: 

```
sudo pacman -Sy
```

2. Проверьте установленные пакеты и найдите ненужные:

```
pacman -Qdt
```

3. Удалите ненужные пакеты с помощью команды:

```
sudo pacman -Rns <package_name
````

4. После удаления пакетов очистите кэш Pacman, чтобы освободить дисковое пространство:

```
sudo pacman -Sc
```

Если вы хотите удалить все неиспользуемые пакеты и кэш одновременно, используйте команду:

```
sudo pacman -Rns $(pacman -Qdtq) && sudo pacman -Sc
```

Эта команда удалит все ненужные пакеты и затем очистит кэш Pacman.

## Очистка AUR

Чтобы очистить Manjaro Linux от ненужных пакетов из репозитория AUR (Arch User Repository), вы можете использовать утилиту Yay, которая является расширением Pacman и позволяет управлять пакетами из AUR.

Вот несколько шагов, которые можно выполнить:

1. Установите Yay, если его еще нет на вашей системе. Можно установить его из AUR с помощью следующих команд:

```
git clone https://aur.archlinux.org/yay.git cd yay makepkg -si
```

2. Обновите список доступных пакетов:

```
yay -Sy
```

3. Проверьте установленные пакеты из AUR и найдите ненужные:

```
yay -Qdt
```

Эта команда покажет установленные пакеты из AUR, которые больше не требуются ни одним другим пакетом.

4. Удалите ненужные пакеты с помощью команды:

```
yay -Rns <package_name>
```

Замените `<package_name>` именем пакета, который вы хотите удалить. При этом команда удалит не только пакет, но и все его зависимости, которые больше не используются другими пакетами.

5. После удаления пакетов очистите кэш Yay, чтобы освободить дисковое пространство:

```
yay -Sc
```

Если вы хотите удалить все неиспользуемые пакеты из AUR и кэш одновременно, используйте команду:

```
yay -Rns $(yay -Qdtq) && yay -Sc
```

Эта команда удалит все ненужные пакеты из AUR и затем очистит кэш Yay.

Убедитесь, что перед удалением пакетов из AUR вы внимательно проверили, чтобы не удалить пакеты, которые все еще нужны для работы вашей системы или установленных программ. Будьте осторожны при удалении пакетов, чтобы не повредить функциональность вашей системы.

## Alacritty

https://alacritty.org/config-alacritty.html

https://gist.github.com/alexey-goloburdin/fbd0089a7853dada5e26697cb2164ba1

https://wiki.archlinux.org/title/Alacritty_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)

https://www.joshmedeski.com/posts/setting-up-alacritty-for-a-fast-minimal-terminal-emulator/

https://github.com/joshmedeski/dotfiles/tree/main

## MPV

https://mpv.io
https://wiki.archlinux.org/title/mpv
https://github.com/mpv-player/mpv/blob/master/etc/input.conf


Исходные файлы конфигурации находятся: `/usr/share/doc/mpv/`

General settings. Add the following settings to:

`~/.config/mpv/mpv.conf`

Key bindings. Add the following examples to:

 `~/.config/mpv/input.conf`

## Tmux

https://github.com/gpakosz/.tmux
https://github.com/tmux/tmux/wiki
https://github.com/tmux-plugins/tpm

Tmux Plugin Manager. Установка или обновление плагинов: `prefix + I`
Tmux Plugin Manager. Удаление плагинов: `prefix + Alt + U`

Tmux-resurrect key bindings:
```
- `prefix + Ctrl-s` - save
- `prefix + Ctrl-r` - restore
```

## Lf 

https://github.com/gokcehan/lf
https://pkg.go.dev/github.com/gokcehan/lf
https://github.com/gokcehan/lf/blob/master/lf.1

## TeamViewer

https://wiki.manjaro.org/index.php/TeamViewer

If TeamViewer does not detect the teamviewerd deamon, you can reinstall the deamon by

```
sudo teamviewer --daemon enable
```

If it's not enabled or started you can use

```
systemctl enable teamviewerd
```

```
systemctl start teamviewerd
```

## VirtualBox

Добавляем общую папку (Shared Folders) + ставим auto-mount

Качаем образ VBoxGuestAdditions_7.0.20.iso 
https://download.virtualbox.org/virtualbox/7.0.20/
и цепляем его в приводе дисков

Переходим в папку /run/media/olejon/VBox... и запускаем: 

```
sudo sh VBoxLinuxAdditions.run
```

Добавляем пользователя в группу vboxsf:

```
sudo usermod -aG vboxsf $USER
```
После выходим из учетки пользователя и заходим снова.

---

Следующий шаг - монтирование общей папки в гостевой системе.
В терминале введите следующую команду для создания папки, в которую будет монтироваться общая папка:

```
sudo mkdir /media/shared
```

Введите следующую команду для монтирования общей папки:

```
sudo mount -t vboxsf имя_общей_папки /media/shared
```

Замените "имя_общей_папки" на имя, которое вы задали в настройках VirtualBox.

Теперь вы можете использовать общую папку внутри гостевой системы Linux. Она будет доступна в папке `/media/shared`.

## Thunderbird

Запуск менеджера профилей Thunderbird:

```
thunderbird -ProfileManager
```

Изменение порядка сортировки:
Правка -> Настройки -> (ищем Редактор настроек)
Ищем `mailnews.default` (и вместо 1 ставим 2)

