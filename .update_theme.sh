
#! /bin/bash

# Copy local changes to repository

DEST="$HOME/.custom-themes/xmonad-dark-paradise"

# STARTUP SCRIPT
cp $HOME/.config/autostart/sessions/xmonad-dark-paradise $DEST/

# X
cp $HOME/.Xresources $DEST/
cp -r $HOME/.themes/dark-paradise $DEST/gtk/
cp -r $HOME/.backgrounds/dark-paradise $DEST/backgrounds/

# Compton
cp $HOME/.config/compton.conf $DEST/

# Emacs
cp -r $HOME/.emacs.d/{init.el,spacemacs-dark-paradise-theme.el} $DEST/emacs/
cp $HOME/.spacemacs $DEST/emacs/

# LightDM
sudo cp /etc/lightdm/lightdm-gtk-greeter.conf $DEST/lightdm/

# ROFI
cp $HOME/.config/rofi/config $DEST/rofi/

# Terminal
cp $HOME/.config/termite/config $DEST/termite/

# Tint2
cp $HOME/.config/tint2/tint2rc $DEST/tint2/

# Xmonad
cp -r $HOME/.xmonad $DEST/xmonad/
