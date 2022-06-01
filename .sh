#!/usr/bin/env sh

Release="https://github.com/ServedSpicy/Bundle/releases/download/Dummy/Dummy.zip"
Folder="$HOME/.ServedSpicy"
Download="${Folder}/Download.zip"
Applications="$HOME/.local/share/applications"
DesktopEntry="${Applications}/ServedSpicy-Configurator.desktop"


# Install Deno

echo "Installing Deno"

curl -fsSL https://deno.land/install.sh | sh > /dev/null


# Install Serial Library

echo "Installing Serial Library"

sudo apt install libserial1


# Setting Up Files

rm              \
    --recursive \
    $Folder
    
mkdir $Folder


# Download Release

echo "Downloading Latest Release"

curl                    \
    --output $Download  \
    -LJO                \
    $Release
    
    
# Extract Archive

unzip           \
    -d $Folder  \
    $Download


# Cleanup

rm $Download

mv $Folder/Dummy/ $Folder/App/