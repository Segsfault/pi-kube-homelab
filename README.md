# Setup a pi from scratch using Ansible
Setting up a brand new Pi can be a tedious process.  Having started down a path of managing clusters of Pis, 
I needed an easier way to configure them in a headless environment.  This repo contains snippets drawn from
dozens of other Pi and Ansible users.

#### Prerequisites
This repo was
developed using the the August 2020 [Rasperry Pi OS (32bit) Lite](https://www.raspberrypi.org/downloads/raspberry-pi-os/) version of Linux.

After flashing, I used `touch /boot/ssh` on the mounted SD card to enable SSH.  

This repo assumes a fresh install, where the default Pi username and password are present.


## Getting started: 
This guide assumes you are already a SSH user, and have a public key than can be shared to enable passwordless access.

First we need to modify the `hosts` file included in the repo.  Here, replace the content with 
the desired hostname and actual IP address for each host you want to configure.  If you don't know the IP
addresses of your Pi(s), you can either plug in a keyboard and monitor and run `ifconfig`, or turn to 
the interwebs.  My router does a great job listing all devices on my network, and I usually rely on it.  
However you get them, fill out that `hosts` file.

## Setting up the Pi
In the `group_vars` directory, edit the files 

In `pi-setup.yml`, you can change the localization variables to things more relevant for you.  You'll note that
the setup will call two roles. The first `common` updates the hostname, locale, and apt packages.  The second, 
`slim` will disable wifi, bluetooth, ipv6, delete the `pi` user, and cleanup some annoying warning messages
in the MOTD.

Feel free to modify or delete entries entirely from the `main.yml` files. For example, if you want to preserve
wifi, edit the `disable_hardware.yml` file or comment/delete the reference in `main.yml`.

When ready, run `ansible-playbook -i hosts pi-setup.yml` to fully configure the pi(s)


sudo apt install xserver-xorg
sudo apt install raspberrypi-ui-mods
sudo apt-get install xdotool unclutter sed
sudo apt install chromium-browser -y
edit /etc/lightdm/lightdm.conf to add autologin user
run raspi-config to set autologin

add
/etc/xdg/lxsession/LXDE
@xset s off 
@xset -dpms

