#!/bin/bash
echo "Welcome to DO-script installation!"
sleep 1; echo "I will check whether you already have 'scripts' directory and if not - create it for you."
sleep 1; echo "Checking:"
sleep 1;
DIRECTORY="/home/$USER/scripts"
if [ -d $DIRECTORY ]; then
    echo "Directory 'scripts' already exists --> moving DNSes files to the 'scripts' folder:"
    sleep 1; echo "In progress..."
else
    echo "Directory ‘scripts’ doesn't exist --> creating 'scripts' directory:";
    sleep 1; echo "In progress..."
    mkdir ~/scripts; chmod 755 ~/scripts
    sleep 1; echo "Directory 'scripts' created --> moving DNSes files to the 'scripts' folder.";
fi
mv do.sh ~/scripts;
sleep 1; echo "Files moved."
echo 'alias do="bash do.sh"' >> ~/.bashrc
sleep 1; echo "Changing permissions for 'scripts' folder and files inside of it:"
chmod -R -v 755 ~/scripts;
sleep 1; echo "Permissions changed."
sleep 1; echo "INSTALLATION FINISHED, ENJOY!"
echo "=========================HOW-TO USE THIS SCRIPT==========================";
echo "to access the server just type 'do domain.com'";
echo "=========================================================================";
sleep 1; exec bash;
