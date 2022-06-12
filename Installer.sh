#!/usr/bin/env sh



deno="$HOME/.deno/bin/deno"



clear



# Set Title

export PROMPT_COMMAND='echo -ne "\033]30;ServedSpicy Installer\007"'



# Ensure Deno

#if ! type "deno" > /dev/null; then


if [ -e $deno ]; then
    
    echo "Deno is already installed"

else    
    
    curl -fsSL https://deno.land/install.sh | sh > /dev/null
    
    echo 'export DENO_INSTALL="/$HOME/.deno"' >> $HOME/.bashrc
    echo 'export PATH="$DENO_INSTALL/bin:$PATH"' >> $HOME/.bashrc
    
    # source ~/.bashrc
fi


# Use the local installer in debug mode.

if [ $1 = "debug" ]; then
    
    echo "Debug Mode Enabled"
    
    current="$(dirname -- $(readlink -fn -- "$0"; echo x))/"
    
    installer="${current}/../Installer/Source/App.js"
    imports="${current}/../Installer/Source/Imports.json"
    
else
    
    installer="https://raw.githubusercontent.com/ServedSpicy/Installer/0.3.2/Source/App.js"
    imports="https://raw.githubusercontent.com/ServedSpicy/Installer/0.3.2/Source/Imports.json"

fi



desktop_entry="$HOME/.local/share/applications/ServedSpicy.desktop"
folder="$HOME/.ServedSpicy"
config="$HOME/.config/ServedSpicy"
temp="/tmp"

writable="${desktop_entry},${folder},${config},${temp}"
readable="${folder},${config},${temp}"
commands="dpkg-query,apt,curl,unzip,groups,usermod,groupadd"
variables="HOME"


user=$(id -u $USER)
group=$(id -g $USER)

# clear

sudo $deno run                  \
    --allow-write=$writable     \
    --allow-read=$readable      \
    --allow-env=$variables      \
    --importmap=$imports        \
    --allow-run=$commands       \
    --unstable                  \
    $installer                  \
    --home=$HOME                \
    --user=$user                \
    --group=$group
