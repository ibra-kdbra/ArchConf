# SCHEME for uefi without luks
# /
# /efi

# SCHEME for uefi with luks
# /
# /boot
# /efi

grub_create_partitions() {
  local device="${1}" npart="${2}" disklabel="${3}"

  echo -e "${TYS_Y}(TYS) Create partitions for grub uefi${TYS_NC}"
  parted -s "${device}" mklabel "${disklabel}" || exit

  case "${npart}" in
    2)
      # efi, root
      parted -s "${device}" mkpart primary 1MiB 512MiB || exit
      parted -s "${device}" mkpart primary 512MiB 100% || exit
      ;;
    3)
      # efi, boot, root
      parted -s "${device}" mkpart primary 1MiB 512MiB || exit
      parted -s "${device}" mkpart primary 512MiB 1024MiB || exit
      parted -s "${device}" mkpart primary 1024MiB 100% || exit
      ;;
  esac
}

grub_format_and_mount() {
  local device="${1}" npart="${2}" rootpart="${3}"

  echo -e "${TYS_Y}(TYS) Format partitions for grub uefi${TYS_NC}"
  mkfs.fat -F 32 "${device}1" || exit
  if [[ "${npart}" == 3 ]]; then
    mkfs.ext4 -q "${device}2" || exit
  fi

  mkfs.ext4 -q "${rootpart}" || exit
  parted -s "${device}" set 1 boot on || exit

  echo -e "${TYS_Y}(TYS) Mount partitions for grub uefi${TYS_NC}"
  mount "${rootpart}" /mnt || exit
  case "${npart}" in
    2)
      mount --mkdir "${device}1" /mnt"${TYS_DEFAULT_EFI}" || exit
      ;;
    3)
      # crypt + grub : boot is not crypted
      mount --mkdir "${device}2" /mnt/boot || exit
      mount --mkdir "${device}1" /mnt"${TYS_DEFAULT_EFI}" || exit
      ;;
  esac
}

# SCHEME for legacy boot
# /
# /boot

grub_legacy_create_partitions() {
  local device="${1}"

  echo -e "${TYS_Y}(TYS) Create partitions for grub legacy${TYS_NC}"
  parted -s "${device}" mklabel msdos || exit
  parted -s "${device}" mkpart primary 1MiB 512MiB || exit
  parted -s "${device}" mkpart primary 512MiB 100% || exit
}

grub_legacy_format_and_mount() {
  local device="${1}" rootpart="${2}"

  echo -e "${TYS_Y}(TYS) Format partitions for grub legacy${TYS_NC}"
  mkfs.ext4 -q "${device}1" || exit
  mkfs.ext4 -q "${rootpart}" || exit
  parted -s "${device}" set 1 boot on || exit

  echo -e "${TYS_Y}(TYS) Mount partitions for grub legacy${TYS_NC}"
  mount "${rootpart}" /mnt || exit
  mount --mkdir "${device}1" /mnt/boot || exit
}
