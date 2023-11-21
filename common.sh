TYS_NC=$'\e[0;m'
TYS_Y=$'\e[1;33m'
TYS_R=$'\e[1;31m'
TYS_CONFIG="config.sh"

select_block_device() {
  d=$(lsblk --list -dno name | fzf --tac --header "Select block device")
  [[ -z "${d}" ]] && exit 1
  echo "${d}"
}

confirm() {
  local prompt=$1 choice joined default

  shift
  local choices=("$@")

  default=(${choices[@]/#[[:lower:]0-9 ]/})

  printf -v joined '%s,' "${choices[@]}"
  until echo "${choices[@],,}" | grep -qw "${choice,,}"; do
    read -r -p "${prompt} ($(printf "%s" "${joined%,}")) " choice
    [[ "${choice}" == "" ]] && choice="${default[0]}"
  done
  echo "${choice,}"
}

check_fzf() {
  which fzf >/dev/null || {
    echo -e "${TYS_Y}(TYS) Install fzf${TYS_NC}"
    pacman -Sy fzf
  }
}

validate_luksroot() {
  local lroot="${1}"
  [[ "${lroot}" =~ ^(/dev/mapper/)([a-zA-Z0-9]{2,16})$ ]] || {
    echo "luksroot: ${TYS_R}${lroot}${TYS_NC} => Fail! ^(/dev/mapper/)([a-zA-Z0-9]{2,32})$"
    exit
  }
}

validate_bootloader() {
  local bootl="${1}"
  [[ "${bootl}" =~ ^(G|S)$ ]] || {
    echo "booloader: ${TYS_R}${bootl}${TYS_NC} => Fail! ^(G|S)$"
    exit
  }
}

validate_kernel() {
  local kernel="${1}"
  [[ "${kernel}" =~ ^(linux|linux-lts)$ ]] || {
    echo "kernel: ${TYS_R}${kernel}${TYS_NC} => Fail! ^(linux|linux-lts)$"
    exit
  }
}

validate_mirrorcountry() {
  local country="${1}"
  [[ "${country}" =~ ^([A-Z]){2}$ ]] || {
    echo "mirrorcountry: ${TYS_R}${country}${TYS_NC} => Fail! ^([A-Z]){2}$"
    exit
  }
}

validate_keymap() {
  local keymap_code="${1}"
  [[ "${keymap_code}" =~ ^([a-zA-Z0-9-]){2,30}$ ]] || {
    echo "keymap: ${TYS_R}${keymap_code}${TYS_NC} => Fail! ^([a-zA-Z0-9-]){2,30}$"
    exit
  }
}

validate_locale() {
  local lang="${1}"
  [[ "${lang}" =~ ^([a-z]){2,3}_([A-Z]){2}$ ]] && grep "${lang}.UTF-8" </etc/locale.gen &>/dev/null || {
    echo -e "lang: ${TYS_R}${lang}${TYS_NC} => Fail! ^([a-z]){2,3}_([A-Z]){2}\$ | not in /etc/locale.gen"
    exit
  }
}

validate_timezone() {
  local region_city_tm="${1}"
  [[ -f /usr/share/zoneinfo/"${region_city_tm}" ]] || {
    echo "timezone: ${TYS_R}${region_city_tm}${TYS_NC} => Fail! -f /usr/share/zoneinfo/[Region/City]"
    exit
  }
}

validate_hostname() {
  local hname="${1}"
  [[ "${hname}" =~ ^([a-zA-Z0-9])([a-zA-Z0-9-]{0,62})$ ]] || {
    echo "hostname: ${TYS_R}${hname}${TYS_NC} => Fail! ^([a-zA-Z0-9])([a-zA-Z0-9-]{0,62})$"
    exit
  }
}

validate_login() {
  local login="${1}"
  [[ "${login}" =~ ^[a-z_]([a-z0-9_-]{0,31}|[a-z0-9_-]{0,30}\$)$ ]] || {
    echo "login: ${TYS_R}${login}${TYS_NC} => Fail! ^[a-z_]([a-z0-9_-]{0,31}|[a-z0-9_-]{0,30}\$)"
    exit
  }
}
