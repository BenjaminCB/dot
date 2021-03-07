#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

if [[ $(hostname) == 'arco-desktop' ]]; then
    /home/bcb/git/scripts/screen_rotation.sh 
fi

#$HOME/.config/polybar/launch.sh &

# im am root picture
# https://imgur.com/a/Ix8QBfl
nitrogen --head=0 --set-zoom-fill ~/git/wallpapers/horizontal/Shiomiya_Shiori_Holding_Shy_C_Programming_language_wp_gruvbox.png
nitrogen --head=1 --set-auto ~/git/wallpapers/vertical/anime_book_computer_grevbox_neofetch_vim.png

xsetroot -cursor_name left_ptr &
run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &

if [[ $(hostname) == 'arco-desktop' ]]; then
    run nm-applet &
    run xfce4-power-manager &
    picom --config $HOME/.config/bspwm/picom.conf &
    /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
    run volumeicon &
else
    batsignal -b &
fi
numlockx on &
dunst &
redshift &
