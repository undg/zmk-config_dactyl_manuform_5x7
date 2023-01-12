#!/usr/bin/env zsh

now=$(date +%Y-%m-%d_%H-%m_%S)

cd ~/Code/kbd-dactyl_manuform_5x7-zmk-config/

cp ~/Code/zmk/app/boards/shields/dactyl_manuform_5x7/dactyl_manuform_5x7.keymap config/dactylM.keymap; git add .; git cm -m "build_$now"; git push

cd -

