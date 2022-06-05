#!/usr/bin/env sh

clear


# Ensure Deno

if ! type "deno" > /dev/null; then
    curl -fsSL https://deno.land/install.sh | sh > /dev/null
fi


# Use the local installer in debug mode.

if [ $1 = "debug" ]; then
    
    echo "Debug Mode Enabled"
    
    current="$(dirname -- $(readlink -fn -- "$0"; echo x))/"
    installer="${current}/../Installer/Source/App.js"
    imports="${current}/../Installer/Source/Imports.json"
else
    installer="https://raw.githubusercontent.com/ServedSpicy/Installer/main/Source/App.js"
    imports="https://raw.githubusercontent.com/ServedSpicy/Installer/main/Source/Imports.json"
fi


deno=$(which deno)

desktop_entry="/usr/share/applications/ServedSpicy.desktop"
folder="$HOME/.ServedSpicy"
config="$HOME/.config/ServedSpicy"
temp="/tmp"

writable="${desktop_entry},${folder},${config},${temp}"
readable="${folder},${config},${temp}"
commands="dpkg-query,apt,curl,unzip"
variables="HOME"


sudo $deno run                  \
    --allow-write=$writable     \
    --allow-read=$readable      \
    --allow-env=$variables      \
    --importmap=$imports        \
    --allow-run=$commands       \
    --unstable                  \
    $installer                  \
    --home=$HOME
