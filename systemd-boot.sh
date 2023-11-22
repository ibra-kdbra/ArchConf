# SCHEME 1 for uefi
# /
# /boot

sysdb_create_partitions() {
  local device="${1}" disklabel="${2}"

  echo -e "${TYS_Y}(TYS) Create partitions for systemd-boot${TYS_NC}"
  parted -s "${device}" mklabel "${disklabel}" || exit
  parted -s "${device}" mkpart primary 1MiB 1024MiB || exit
  parted -s "${device}" mkpart primary 1024MiB 100% || exit
}

sysdb_format_and_mount() {
  local device="${1}" rootpart="${2}"

  echo -e "${TYS_Y}(TYS) Format partitions for systemd-boot${TYS_NC}"
  mkfs.fat -F 32 "${device}1" || exit
  mkfs.ext4 -q "${rootpart}" || exit

  echo -e "${TYS_Y}(TYS) Mount partitions for systemd-boot${TYS_NC}"
  parted -s "${device}" set 1 boot on || exit
  mount "${rootpart}" /mnt || exit
  mount --mkdir "${device}1" /mnt/boot || exit
}
