# the-plants

# Setup

## Install git
```
sudo apt-get install git
```

## Configure git
Install gh-cli for authentication
```
type -p curl >/dev/null || sudo apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y
```

Then run to authenticate:
```
gh auth login
```
username: playablestreets@gmail.com  
pass: [see trello]



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
- copy ./config/rc.local to /etc/
- copy ./config/safe_shutdown_Pi.py to /home/pi/

Reboot to test everything boots up correctly.


# Notes
-- Automatic start of PD patch --

The config file /etc/xdg/lxsession/LXDE-pi/autostart determines which PD patch will be loaded on boot. You can edit the last line to choose a different patch.
e.g, you could change
@purr-data -jack /home/pi/Desktop/Physical_Kidstruments/musicbox/pd/_MAIN.pd
to
@purr-data -jack /home/pi/Desktop/example.pd

-- Automatic shutdown script --

A safe-shutdown Python script is automatically loaded on boot (~/safe_shutdown_Pi.py loaded by /etc/rc.local). This sets a pull-up on pin number 37 (aka GPIO26) and monitors it: If the pin is pulled to ground, the script will shut down the system. 
You can connect a momentary button between pins 37 (GPIO26) and 39 (GND) for use as a safe shutdown button.

Please press the shutdown button for about 1 second to make sure it registers.

-- ESP32 capacitance --

Purr Data is reading capacitance from esp32 pins 4(A5), 12(A11) and 15(A8).
