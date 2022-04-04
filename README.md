# Strap scripts for quick Arch Linux setup

## What's this?

As a way for me to practice shell scripting, I've created two scripts to automate Arch Linux setup for end users and schools. This script automates wine installation (gaming), chaotic AUR, anbox, and many more. You may use this script for any purpose, and you may redistribute/modify it to suit you or your organization.

## Usage

For end users:

```
git clone https://github.com/Mistreaper/strap-scripts
cd strap-scripts
chmod +x strap-user.sh && ./strap-user.sh
```

For computer labs in schools (education edition)

```
git clone https://github.com/Mistreaper/strap-scripts
cd strap-scripts
chmod +x strap-education-edition.sh && ./strap-education-edition.sh
```

## Quick info about applications installed

## For the user script:

`wine-staging` and `lutris`: Windows compatibility layer + frontend.

`opera-ffmpeg-codecs`: This is proprietary codecs, not installed automatically when installing the `opera` package

`steam`: You know this, it's a game platform

`polymc`: This is a Minecraft launcher, the official one is broken and `multimc`'s creator hasn't maintainted the AUR package and he is a manchild who throws tantrums.

`fcitx5` and others: This is for Chinese/Korean/Japanese input.

`blender` and `krita`: Blender is a FOSS 3D modelling software, and Krita is a FOSS art software.

`unityhub`: Unity Hub, for game development. `godot` is also a game engine, but it's FOSS.

`visual-studio-code-bin`: This is a great text editor that can be turned into an IDE when you install several extensions. It also has an integrated terminal. If you don't want Microsoft telemetry and GitHub, get `vscodium` instead. 

`proton-ge-custom-bin`: This is a version of Steam's Proton (compatibility layer), some games work better with it.

`grapejuice-git`: This is grapejuice, a launcher for Roblox wine.

## For education edition, there may be several EXTRA software installed:

`veyon`: FOSS software for classroom control in computer labs.

`kolibri`: You can use this to download teaching resources.

`fritzing` and `librecad`: These are software for Computer Aided Design (CAD). Useful for teaching computers and how they work.

`scratch3-bin`: Block-based programming, useful for learning algorithm before stepping into Python or other text-based languages. 