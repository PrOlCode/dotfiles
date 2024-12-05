#!/bin/bash
wmctrl -s 2
xset r rate 350 50
alacritty -e tmux & disown
yandex-browser-stable & disown
