#!/usr/bin/env sh

name="ServedSpicy Installer"
file_temp=/tmp/ServedSpicy_installer_XXXXXX.sh
link_installer=https://raw.githubusercontent.com/ServedSpicy/Install/main/Installer.sh


clear

ignore=/dev/null
installer=$(mktemp $file_temp)

curl -sfS $link_installer > $installer

sudo chmod +x $installer



if type "gnome-terminal" > $ignore; then

    echo "Using Gnome-Terminal"

    sudo gnome-terminal \
        --hide-menubar  \
        --title $name   \
        --name=$name    \
        -- $installer > $ignore
        
elif type "konsole" > $ignore; then
    
    echo "Using Konsole"
    
    sudo konsole        \
        --hide-menubar  \
        -e $installer > $ignore
    
else
    
    echo "Your system is missing a terminal that the installer supports."
    echo "Try installing gnome-terminal with:"
    echo "sudo apt install gnome-terminal"
    
fi




    
rm $installer


# clear