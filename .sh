#!/usr/bin/env sh

clear

# Ensure Deno

if ! type "deno" > /dev/null; then
    curl -fsSL https://deno.land/install.sh | sh > /dev/null
fi


# # Ensure LibSerial
# 
# if [ "" = "$(dpkg-query -W --showformat='${Status}\n' libserial1|grep "install ok installed")" ]; then
#     sudo apt --yes install libserial1
# fi


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

writable="${desktop_entry},${folder},${config}"
readable="${folder},${config}"
variables="HOME"


sudo $deno run                  \
    --allow-write=$writable     \
    --allow-read=$readable      \
    --allow-env=$variables      \
    --importmap=$imports        \
    --unstable                  \
    $installer                  \
    --home=$HOME


# 
# 
# Release="https://github.com/ServedSpicy/Bundle/releases/download/Dummy/Dummy.zip"
# Folder="$HOME/.ServedSpicy"
# Download="${Folder}/Download.zip"
# Applications="$HOME/.local/share/applications"
# DesktopEntry="${Applications}/ServedSpicy-Configurator.desktop"
# 
# 
# # Install Deno
# 
# echo "Installing Deno"
# 
# 
# 
# 
# # Install Serial Library
# 
# echo "Installing Serial Library"
# 
# sudo apt install libserial1
# 
# 
# # Setting Up Files
# 
# rm              \
#     --recursive \
#     $Folder
# 
# mkdir $Folder
# 
# 
# # Download Release
# 
# echo "Downloading Latest Release"
# 
# curl                    \
#     --output $Download  \
#     -LJO                \
#     $Release
# 
# 
# # Extract Archive
# 
# unzip           \
#     -d $Folder  \
#     $Download
# 
# 
# # Cleanup
# 
# rm $Download
# 
# mv $Folder/Dummy/ $Folder/App/