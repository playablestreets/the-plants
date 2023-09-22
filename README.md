# the-plants

# Setup

## Clone this repository to desktop

To clone to the desktop run the following ( or alternatively use Github Desktop)
```
cd ~/Desktop
git clone https://github.com/playablestreets/the-plants
cd the-plants
git submodule update --init --recursive
```

To update run:
```
cd ~/Desktop/the-plants
git pull origin main
```


## Install and configure Jack
```
sudo apt-get install qjackctl

#start Jack for testing
qjackctl --start &

```
Set up correct audio outputs etc in Jack.


## Install Purr-Data
```
echo 'deb http://download.opensuse.org/repositories/home:/aggraef/Raspbian_10/ /' | sudo tee /etc/apt/sources.list.d/home:aggraef.list
curl -fsSL https://download.opensuse.org/repositories/home:aggraef/Raspbian_10/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_aggraef.gpg > /dev/null
sudo apt update
sudo apt install purr-data
```

Open Purr Data and check audio out to Jack is working, Midi in if required. More details: https://agraef.github.io/purr-data/#jgu-packages 
```
purr-data -jack &
```

## Copy configuration files

- copy ./config/autostart to /etc/xdg/lxsession/LXDE-pi/
- ./config/copyscripts.sh will do this for you.

Reboot to test everything boots up correctly.


# Notes
## Automatic start of PD patch

The config file /etc/xdg/lxsession/LXDE-pi/autostart determines which PD patch will be loaded on boot. You can edit the last line to choose a different patch.
e.g
@purr-data -jack /home/pi/Desktop/Physical_Kidstruments/musicbox/pd/MAIN.pd
@purr-data -jack /home/pi/Desktop/example.pd


## Automatic shutdown script

Shutdown and update are handled by plants.watcher.py.  Pd creates temporary files in ./config to trigger shutdown and update actions. 

## ESP32 capacitance

Purr Data is reading capacitance from two MPR121s via an ESP32 and slip serial.
[comport] and [mrpeach/slipdec] are dependencies.

# TODO

Move sensor reading into python script.
Read sensor values in PD via OSC.
Make fully vanilla compatible.
