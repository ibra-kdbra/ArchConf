# WARNING!
# This file is copied to chroot in step 01
# At the end of step 02, passwords are removed from the copy in chroot
# Don't forget to take note of your passwords before rebooting...!
TYS_DEFAULT_BOOTLOADER=G
TYS_DEFAULT_MIRROR_COUNTRY=US
TYS_DEFAULT_TIMEZONE=America/Montreal
TYS_DEFAULT_LANG=fr_CA
TYS_DEFAULT_KEYMAP=cf
TYS_DEFAULT_HOSTNAME=archie
TYS_DEFAULT_LOGIN=tys
TYS_DEFAULT_ROOTPWD=12
TYS_DEFAULT_USERPWD=12

# Grub only
TYS_DEFAULT_EFI=/boot/efi

# Systemd-boot only
TYS_DEFAULT_KERNEL=linux-lts

# Luks
TYS_DEFAULT_LUKSROOT=/dev/mapper/root
# If you dont want to crypt the root partition, remove the password: TYS_DEFAULT_LUKSPWD=
TYS_DEFAULT_LUKSPWD=12
