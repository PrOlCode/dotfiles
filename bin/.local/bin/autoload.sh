#!/bin/bash

sleep 2
wmctrl -s 2

setsid alacritty >/dev/null 2>&1 &
# alacritty -e tmux & disown
# brave & disown
# brave >/dev/null 2>&1 &
# yandex-browser-stable & disown
