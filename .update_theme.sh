
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

# Spacemacs
cp -r $HOME/.emacs.d/{init.el,spacemacs-dark-paradise-theme.el,private/gigi} $DEST/emacs/
cp $HOME/.spacemacs $DEST/emacs/

# LightDM
sudo cp /etc/lightdm/lightdm-gtk-greeter.conf $DEST/lightdm/

# ROFI
cp -r $HOME/.config/rofi/* $DEST/rofi/

# Termite
cp $HOME/.config/termite/config $DEST/termite/

# Kitty
cp $HOME/.config/kitty/kitty.conf $DEST/kitty/

# Tint2
cp $HOME/.config/tint2/tint2rc $DEST/tint2/

# Tmux
cp $HOME/.tmux.conf $DEST/

# Xmonad
cp -r $HOME/.xmonad/xmonad.hs $DEST/xmonad/
