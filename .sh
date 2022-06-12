#!/usr/bin/env sh

name="ServedSpicy Installer"
file_temp=/tmp/ServedSpicy_installer_XXXXXX.sh
link_installer=https://raw.githubusercontent.com/ServedSpicy/Install/main/Installer.sh


clear


installer=$(mktemp $file_temp)

curl -sfS $link_installer > $installer

sudo chmod +x $installer

sudo gnome-terminal \
    --hide-menubar  \
    --title $name   \
    --name=$name    \
    -- $installer
    
rm $installer


clear