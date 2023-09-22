#!/bin/bash
cd /home/pi/Desktop/the-plants
echo "pulling from git"
git pull
cd config
echo "copying scripts"
./copyscripts.sh
echo "rebooting in 5 seconds..."
sleep 5
systemctl reboot