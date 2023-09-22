#!/bin/bash
cd /home/pi/Desktop/the-plants
echo "pulling from git"
git pull
cd config
echo "copying scripts"
./copyscripts.sh
sleep 5
echo "rebooting in 5 seconds..."
systemctl reboot