# Strap scripts for quick Arch Linux setup

## What's this?

As a way for me to practice shell scripting, I've created two scripts to automate Arch Linux setup for end users and schools. This script automates wine installation (gaming), chaotic AUR, minecraft, and many more. You may use this script for any purpose, and you may redistribute/modify it to suit you or your organization.



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

![](/img/archlunix.png)

## Quick info about applications installed

## For the user script:

`yay`, AUR, and chaotic-aur: So basically, in Arch Linux you have two types of software repositories: the official ones and the AUR (Arch User Repository). The official repositories contain the most popular software, and you install `.pkg.tar.zst` files into `/var/cache/pacman/pkg` or somewhere else specified in `/etc/pacman.conf`. 

You *can* specify custom repositories in `/etc/pacman.conf`, but the AUR is special; you upload `PKGBUILDS` instead of `.pkg.tar.zst` files. The file is used to create a `.pkg.tar.zst` file, which is then installed into your system.

`PKGBUILDS` are a great way to distribute software, and it is one of the many features of `pacman` and Arch Linux that makes it great. The "manual" way to install it is like this:

```
git clone https://aur.archlinux.org/$PKGNAME.git
cd $PKGNAME
makepkg -si
```
But, with `yay`, you can just run `yay -S $PKGNAME` or even query the database with `yay -Ss $PKGNAME`. The tool will search the `pacman` repos first before searching the AUR.

**What is the Chaotic AUR?**

The Chaotic AUR is a pacman repository where you can install precompiled AUR binaries. This is useful for installing software that you don't want to compile yourself.

The Chaotic AUR distributes binaries in `.pkg.tar.zst`, and you can use `pacman` to install from the Chaotic AUR.

Websites: [
    
[Chaotic AUR guide](https://aur.chaotic.cx/)

[Request a Chaotic AUR package](https://github.com/chaotic-aur/packages/issues/new?assignees=&labels=request%3Anew-pkg&template=new-package-requests.yml&title=%5BRequest%5D+)

[Arch User Repos](https://aur.archlinux.org/) 

`wine-staging` and `lutris`: Windows compatibility layer + frontend.

`opera-ffmpeg-codecs`: These are proprietary codecs, not installed automatically when installing the `opera` package

`steam`: You know this. 

`minecraft-launcher`: Minecraft is a sandbox game created by Mojang. Note that you need to buy a Minecraft account and migrate it to Microsoft to play the game.

`polymc`: This is a better Minecraft launcher that allows you to have several instances with different mods and texture packs. 

`fcitx5` and others: This is for Chinese/Korean/Japanese input.

`blender` and `krita`: Blender is a FOSS 3D modelling software, and Krita is a FOSS art software.

`unityhub`: Unity Hub, for game development. `godot` is also a game engine, but it's FOSS.

`visual-studio-code-bin`: This is a great text editor that can be turned into an IDE when you install several extensions. It also has an integrated terminal. If you don't want Microsoft telemetry and GitHub, get `vscodium` instead. 

`proton-ge-custom-bin`: This is a version of Steam's Proton (compatibility layer), some games work better with it.

`grapejuice-git`: This is grapejuice, a launcher for Roblox wine.

## For education edition, there are several EXTRA software installed:

`veyon`: FOSS software for classroom control in computer labs.

`kolibri`: You can use this to download teaching resources.

`fritzing` and `librecad`: These are software for Computer Aided Design (CAD). Useful for teaching computers and how they work.

`scratch3-bin`: Block-based programming, useful for learning algorithm before stepping into Python or other text-based languages.

`ktouch`: This is a touch typing tutor for noobs and experienced touch typers made by KDE.  
