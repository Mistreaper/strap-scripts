#!/bin/bash
# ------------------------------------------------------------
# run chmod +x strap-education-edition.sh && ./strap-education-edition.sh to run this script.
# Author: Mistreaper#9452
# This is for end users who wants a quick configuration on their system. 
# This is also for me to practice shell scripting. 
# ------------------------------------------------------------
# install keyring
echo "Installing keyring..."
sudo pacman -S --needed archlinux-keyring

echo "Enabling file indexing..."
balooctl enable
echo "folders[$e]=/" >> ~/.config/baloofilerc

# ask user to update system:
echo "Updating system..."
while read -p "Do you want to update your system (recommended for fresh install)? (y/n) " yn; do 
    case $yn in
        [Yy]* ) echo "This will take a while"; 
        sudo pacman -Syu; 
        echo "your system is ready. run reboot to reboot your system (recommended)"; 
        sleep 1s
        echo "remember to respond (n) next time to the prompt";
        exit;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done
# install yay
if ! [ -x "$(command -v yay)" ]; then
    # install yay
    echo "yay is not installed. installing yay..."
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si
    cd ..
    sudo rm -r yay-bin
    echo "When installing something with yay, press enter to continue"
fi

# install Chaotic AUR (precompiled AUR binaries)
sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036 
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' 
echo '[chaotic-aur]' | sudo tee -a /etc/pacman.conf> /dev/null 
echo 'Include = /etc/pacman.d/chaotic-mirrorlist' | sudo tee -a /etc/pacman.conf > /dev/null
sudo pacman -Sy # sync chaotic AUR
echo "Initializing guest user"
yay -S --needed systemd-guest-user 
sleep 2s
echo "Please put configuration in /etc/skel"
while true; do 
    read -p "Do you want to clone my configuration (recommended)? (y/n) " yn  
        case $yn in
            [Yy]* ) echo "Cloning configuration..."; 
            sudo pacman -S --needed kvantum;
            yay -S nerd-fonts-droid-sans-mono;
            sudo rm -r /etc/skel; 
            sudo git clone https://github.com/Mistreaper/skel /etc/skel; 
            break;;
            [Nn]* ) break;;
            * ) echo "Please answer yes or no.";;
        esac
done 
# browser installation prompt with numbers (user input)
# Packages: Opera will be opera and opera-ffmpeg-codes, Chrome is google-chrome (AUR), Edge is microsoft-edge-stable-bin (AUR), Brave is brave-bin (AUR). 
while true; do
    read -p "Which browser do you want to install? (1) Opera (with opera-ffmpeg-codecs), (2) Chrome, (3) Edge, (4) Brave, (5) None " browser
    case $browser in
        [1]* ) yay -S --needed opera opera-ffmpeg-codecs; break;;
        [2]* ) yay -S --needed google-chrome; break;;
        [3]* ) yay -S --needed microsoft-edge-stable-bin; break;;
        [4]* ) yay -S --needed brave-bin; break;;
        [5]* ) break;;
        * ) echo "Please answer 1, 2, 3, 4 or 5.";; 
    esac
done
# uncomment these lines:
# [multilib]
# Include = /etc/pacman.d/mirrorlist
sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
sudo pacman -Sy # you need to run this

# wine installation 
while true; do
    read -p "Do you wish to install wine (windows app support)? (y/n) " yn
    case $yn in
        [Yy]* ) sudo pacman -S wine-staging lutris xdelta3 xterm zenity winetricks exe-thumbnailer wine-mono wine-gecko;
        winecfg;
        echo "[Software\\\\Wine\\\\X11 Driver] 1269299093" >> ~/.wine/user.reg;
        echo "\"UseXVidMode\" =\"N\"" >> ~/.wine/user.reg;
         break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# fcitx5 installation
while true; do
    read -p "Do you wish to install fcitx5/chinese input? (y/n) " yn
    case $yn in
        [Yy]* ) sudo pacman -S --needed fcitx5 fcitx5-chinese-addons fcitx5-gtk fcitx5-qt fcitx5-configtool ibus;
        echo '# Lines generated by strap-user.sh script by Mistreaper' | sudo tee -a /etc/environment > /dev/null; 
        echo 'GTK_IM_MODULE=fcitx' | sudo tee -a /etc/environment > /dev/null; 
        echo 'QT_IM_MODULE=fcitx' | sudo tee -a /etc/environment > /dev/null;
        echo 'XMODIFIERS=@im=fcitx' | sudo tee -a /etc/environment > /dev/null;
        echo 'QT_IM_MODULE=fcitx' | sudo tee -a /etc/environment > /dev/null;
        break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";; 
    esac
done

# fonts installation
echo "Installing fonts..."
yay -S --needed noto-fonts-sc noto-fonts-emoji
while true; do
    read -p "Would you like to install Mistreaper's Windows fonts? (y/n)" yn 
    case $yn in
        [Yy]* ) sudo mkdir -p /usr/share/fonts/mywindowsfonts; 
        sudo git clone https://github.com/Mistreaper/mywindowsfonts.git /usr/share/fonts/mywindowsfonts; 
        break;;

        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";; 
    esac
done

# extra essentials :)
echo "These are extra essentials that will be installed..."
sleep 2s 

echo "Installing kvantum..."
sudo pacman -S --needed kvantum

echo "Installing clipboard manager.."
sudo pacman -S --needed copyq 

echo "Installing onedrive and gdrive..."
yay -S --needed onedrive-abraunegg kio-gdrive 
systemctl --user enable --now onedrive.service 

echo "Installing unrar..."
sudo pacman -S --needed unrar

echo "Installing a mail client..."
yay -S --needed mailspring gnome-keyring libsecret seahorse kwalletmanager

echo "Installing camera app (Kamoso)..."
sudo pacman -S --needed kamoso 

echo "Installing a printer settings manager. Find drivers on the AUR or hplip and hplip-plugins if using HP."
sudo pacman -S --needed print-manager gscan2pdf

echo "Installing Flatpak..."
sudo pacman -S --needed flatpak



# for hp users
while true; do
    read -p "Do you use HP printers? (y/n) " yn
    case $yn in
    [Yy]* ) yay -S --needed hplip hplip-plugins; break;;
    [Nn]* ) break;;
    * ) echo "Please answer yes or no.";;
    esac
done 

while true; do
    read -p "Do you want to install a graphical package manager (recommended for beginners)? (y/n)" yn
    case $yn in 
        [Yy]* ) yay -S --needed pamac-aur; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done


# Krecorder
while true; do
    read -p "Do you want to install a audio recorder? (y/n)" yn
    case $yn in 
        [Yy]* ) yay -S --needed krecorder; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# omz
while true; do 
    read -p "Do you want to install Oh My Zsh (autocompletion + themes)? (y/n)" yn
    case $yn in
        [Yy]* ) yay -S --needed oh-my-zsh-git; 
        sudo pacman -R grml-zsh-config;
        break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";
    esac

done
# Veyon 
while true; do
    read -p "Do you want to install Veyon (classroom control)? (y/n)" yn
    case $yn in  
        [Yy]* ) yay -S --needed veyon; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done
# kolibri (flatpak)
while true; do 
    read -p "Do you want to install kolibri (khan academy and stuff for education)? (y/n)" yn
    case $yn in
        [Yy]* ) flatpak install kolibri; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac 

done


# visual studio code
while true; do 
    read -p "Install VSCode (text editor)? (y/n)" yn
    case $yn in
        [Yy]* ) yay -S --needed visual-studio-code-bin; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# Install OBS Studio (video recorder for youtube and streaming)
while true; do 
    read -p "Do you want to install OBS studio and its prerequisites? (y/n)" yn
    case $yn in 
        [Yy]* ) sudo pacman -S --needed obs-studio v4l2loopback-dkms; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac 
    
done 
while true; do 
    read -p "Do you want to install fritzing and libreCAD (computer aided design)? (y/n)" yn
    case $yn in
        [Yy]* ) yay -S --needed fritzing librecad; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;  
    esac
done

while true; do 
    read -p "Do you want to install KTouch (touch typing tutor)? (y/n)" yn
    case $yn in
        [Yy]* ) yay -S --needed ktouch; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;  
    esac
done
while true; do
    read -p "Do you want to install Scratch (block based programming)? (y/n)" yn
    case $yn in
        [Yy]* ) yay -S --needed scratch3-bin; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
 done
# Unity Game engine

while true; do 
    read -p "Install Unity game engine? (y/n)" yn
    case $yn in
        [Yy]* ) yay -S --needed unityhub; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# Godot 
while true; do
    read -p "Install Godot game engine? (y/n)" yn
    case $yn in
        [Yy]* ) yay -S --needed godot; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done 

# Art stuff
while true; do
    read -p "Install Krita (2D art) and Blender (3D modelling)? (y/n)" yn 
    case $yn in
        [Yy]* ) sudo pacman -S --needed krita blender;
        echo "Installing Wacom tablet drivers";
        yay -S --needed xf86-input-wacom libwacom kcm-wacomtablet;
        break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done
