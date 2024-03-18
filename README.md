# archiso_scripts

Scripts for installing a basic arch system from archiso

## Warning

This script is experimental and has been test only in virt-manager. Use at your own risk!

## Prerequisites

* One disk available without partitions.

## Instructions

* pacman -Sy git
* git clone <https://github.com/ibra-kdbra/ArchISO_configs.git>
* cd archiso_scripts
* edit defaults.sh
* edit packages.txt
* ./01-pacstrap

> In chroot

* cd root
* ./02-chroot [-qi]
* exit
* ./unmount_partitions
* reboot

## Specs

### Partitions schemes

* Systemd-boot (uefi)
  * / (ext4)  
  * /boot (fat32)
* Grub (uefi) crypted
  * / (ext4)  
  * /boot (ext4)  
  * /boot/efi (fat32)
* Grub (uefi) not crypted
  * / (ext4)  
  * /boot/efi (fat32)
* Grub (bios)  
  * / (ext4)  
  * /boot (ext4)

Notes:

* Grub (bios) will override preferences if system boot in bios mode
* Systemd-boot will override preferences if system has a 32-bit IA32 UEFI

### Accounts

* 1 user account with sudo privileges via
  * /etc/sudoers.d/00_"${login}"

### Kernels

* linux
* linux-lts

### Network

* networkmanager

### Swap

* zram-generator

### Packages installed with pacstrap

* vim
* git
* fzf
* openssh

Note: The packages from packages.txt are installed in step 2


Back to update, now with ArchoLinux, plasma6.

Open to the new desktop environments.

Getaway to the configuration.[AUR](https://aur.archlinux.org/)
