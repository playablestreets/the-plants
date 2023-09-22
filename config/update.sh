#!/bin/bash
cd /home/pi/Desktop/the-plants
git pull
cd config
./copyscripts.sh
systemctl reboot