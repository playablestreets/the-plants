# the-plants

# Setup

## Clone this repository to desktop

To clone to the desktop run the following ( or alternatively use Github Desktop)
```
cd ~/Desktop
git clone https://github.com/playablestreets/the-plants
```

To press * on the keypad or run:
```
cd ~/Desktop/the-plants/config
./update.sh
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
```
cd ~/Desktop/the-plants/config
./copyscripts.sh
```

This will copy ./config/autostart to /etc/xdg/lxsession/LXDE-pi/


Reboot to test everything boots up correctly.


# Notes
## Automatic start of PD patch

The config file /etc/xdg/lxsession/LXDE-pi/autostart determines which PD patch will be loaded on boot. You can edit the last line to choose a different patch.


## Automatic shutdown script

Shutdown and update are handled by plants.watcher.py.  Pd creates temporary files in ./config to trigger shutdown and update actions. 

## ESP32 capacitance

PD is reading capacitance from two MPR121s via an ESP32 and slip serial.
[comport] and [mrpeach/slipdec] are dependencies.

# TODO

Move sensor reading into python script.
Read sensor values in PD via OSC (this might help: https://github.com/gratefulfrog/PythonSlipOSCServer)
Make fully vanilla compatible.
