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





## Install Pure Data 0.54+
As of writing, goto: https://deb.debian.org/debian/pool/main/p/puredata/
- download and open puredata_0.51.4-1_all.deb
if that doesn't work, build from source:
```
sudo apt-get install build-essential automake autoconf libtool gettext
sudo apt-get install libasound2-dev 
sudo apt-get install libjack-jackd2-dev
sudo apt-get install tcl tk wish
cd /home/pi/Downloads/pd-0.54.1
./autogen.sh
./configure --enable-jack
```

- Open Pure Data > help > find externals
- preferences > untick hide foreign architectures
- Search and install armv6-32 or armv7-32 versions of:
	- mrpeach
	- comport
	- shell


```
puredata -jack &
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
