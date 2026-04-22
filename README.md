# Vanilla Arch Installer

## Only for Arch linux users -> [Arch Linux Installation Guide](https://wiki.archlinux.org/index.php/Installation_guide)

***

#### Write Iso to Usb [Wiki](https://wiki.archlinux.org/title/USB_flash_installation_medium#Using_basic_command_line_utilities)

```bash
# sudo dd bs=4M if=path/to/archlinux-x86_64.iso of=/dev/sd_X_ conv=fsync oflag=direct status=progress
```

***

#### En localization is default; for change

* `./installer` lines : 11 - 12
* `./chroot`    lines : 3 - 14
* `./packages`  lines : 673 - 674

#### Boot from [archlinux.iso](https://archlinux.org/download/), then

* we are waiting for a few minutes until the repositories update (`cat /etc/pacman.d/mirrorlist` - reflector.service update)
* `pacman -Sy pacman` if error try:
  * `pacman -Scc`
  * `pacman-key --init`
  * `pacman-key --populate`
  * `pacman -Sy archlinux-keyring`
* `pacman -Sy git`
* `git clone https://github.com/ibra-kdbra/ArchConf`
* `cd ArchConf && ./installer`

***

#### [Arch Linux Installation Guide](https://wiki.archlinux.org/index.php/Installation_guide)

##### it is advisable to use [Archinstall](https://wiki.archlinux.org/title/Archinstall) with *minimal* installation

* set japanese support: `setfont VGA8x16`
* `archinstall`

##### the old version

* `./installer` - install system like [Arch Linux Installation Guide](https://wiki.archlinux.org/index.php/Installation_guide)
  * `/dev/vda` - auto mount (vda - default disk in Gnome Boxes)
  * other      - manual mount
* `./chroot` *(run from ./installer)* - install system in arch-root mode like [Arch Linux Installation Guide](https://wiki.archlinux.org/index.php/Installation_guide#Chroot)

#### NafmanOs - need [Git](https://wiki.archlinux.org/title/Git) installed

* `./packages` - install desktops, packages and settings it
  * Openbox, i3wm, Qtile -> my settings
  * other -> default settings
    * **Qtile**, **i3wm**, **Openbox**
    * **Xfce**
    * **Lxde**
    * **Lxqt**
    * **Enlightenment**
    * **Mate**
    * **Cinnamon**
    * **Gnome**
    * **Budgie**
    * **Pantheon**
    * **Kde Plasma**
    * **Deepin**
* `./swapfile` - create swapfile in work system
* `./links` - creating a working link system (for me: ibrakdbra disk's system)

***

#### Project Hierarchy

```text
Arch_config/
├── config/                # Application configurations (dotfiles)
│   ├── alacritty/         # Terminal emulator settings
│   ├── dunst/             # Notification daemon
│   ├── fish/              # Shell configuration and functions
│   ├── i3/ openbox/ qtile/# Window manager setups
│   ├── nvim/ vim/         # Text editor configs
│   ├── polybar/           # Status bar
│   ├── scripts/           # Custom utility scripts (VPN, volume, brightness)
│   └── ...
├── files/                 # System files and deployment assets
│   ├── bashrc, profile    # Global terminal init files
│   ├── apps/              # Additional .desktop applications
│   ├── hwdb.d/ rules.d/   # System device and udev rules
│   ├── xorg.conf.d/       # X11 configurations
│   └── ...
├── hooks/                 # Developer git hooks
├── chroot                 # Arch-chroot automated installer sequence
├── installer              # Main EFI/BIOS mount and base install script
├── packages               # Desktop environments and package deployment config
├── swapfile               # Swapfile provisioning script
└── links                  # File linker and environment bootstrap
```

***

#### for SSD users

* enabled by default [Periodic TRIM](https://wiki.archlinux.org/title/Solid_state_drive#Periodic_TRIM)
  * `systemctl status fstrim.timer`
* if **NVME** freeze [Troubleshooting](https://wiki.archlinux.org/title/Solid_state_drive/NVMe#Troubleshooting)
  * in `/etc/default/grub` add to `GRUB_CMDLINE_LINUX_DEFAULT` following `nvme_core.default_ps_max_latency_us=5500`
  * to see changes after reboot: `cat /sys/module/nvme_core/parameters/default_ps_max_latency_us`

***

#### Trackball mouse configuration options

1. **Xorg**:
    * `files/xorg.conf.d/70-trackball.conf` -> `/etc/X11/xorg.conf.d/`
    * list: `xinput list`
    * info: `xinput list-props <id>`
2. **Xorg**, **Wayland**: [evsieve](https://github.com/KarsMulder/evsieve)
3. **Xorg**, **Wayland**: [Input Remapper](https://github.com/sezanzeb/input-remapper/)
4. **Xorg**, **Wayland** *(hardcore way)* :
    * `files/hwdb.d/70-mouse-remap.hwdb` -> `/etc/udev/hwdb.d/`
    * list: `sudo libinput list-devices`
    * info: `sudo udevadm info /dev/input/event<id>`
    * click buttons: `sudo evtest`
    * enable: `sudo systemd-hwdb update` and `sudo udevadm trigger`
5. *other way*: [Arch Wiki](https://wiki.archlinux.org/title/Input_remap_utilities)

***

#### Normal mirrors (global is slowly - operator cuts the speed)

`sudo vim /etc/pacman.d/mirrorlist`

```bash
## United Kingdom
Server = https://manchester.m247.com/archlinux/$repo/os/$arch
Server = https://melbourne.co.uk/archlinux/$repo/os/$arch
Server = https://mirror.infernocomms.net/archlinux/$repo/os/$arch

## Austria
Server = https://at.arch.mirror.kescher.at/archlinux/$repo/os/$arch

## Japan
Server = https://miraa.jp/archlinux/$repo/os/$arch
Server = https://ftp.jaist.ac.jp/pub/Linux/ArchLinux/$repo/os/$arch
Server = https://ftp.tsukuba.wide.ad.jp/Linux/archlinux/$repo/os/$arch

```

***

#### `hooks/` - for devolopers

* change **En localization** lines from `packages` in `README.md`
  * for automate - copy this hooks to `.git/hooks/`
  * for manual - run in `hooks/`
* update icons cache for new icons badge: `sudo gtk-update-icon-cache -f /usr/share/icons/hicolor/`

***
***
