# the-plants



when cloning the repo to the pi run the following to load in bop:
```
cd ~/Desktop
git config --global credential.helper store
git clone https://github.com/playablestreets/the-plants
username: playablestreets@gmail.com
pass: [see trello]
cd the-plants
git submodule update --init --recursive
```

to update:
```
cd ~/Desktop/the-plants
git pull origin main
```

