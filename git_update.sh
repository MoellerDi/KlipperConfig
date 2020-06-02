#!/bin/bash

# make a backup of printer.cfg
echo "Backing up *.cfg files to /backup/..."
mv -v ~/*.cfg ~/backup/

# pull latest
echo "Pulling latest version..."

cd ~/git && git pull https://github.com/dystechnic/KlipperConfig.git && cd ..

# Copy config files
echo "Copying new config files..."
cp -v -r ~/git/*.cfg ~/

# ask if user wants to restore the calib parameters
read -p "Do you want to restore printer.cfg (calibration parameters)? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    cp ~/backup/printer.cfg ~/backup/printer.last_known_cfg
    mv ~/backup/printer.cfg ~/printer.cfg
fi
echo "Restored printer.cfg..."
echo # empty line
echo "Copying update script"
cp -v -r ~/git/*.sh ~/
echo "You're good to go!!"
