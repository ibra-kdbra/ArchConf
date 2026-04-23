#!/usr/bin/env bash

#
# Copy Firefox bookmark dumps to a remote server
#

set -euo pipefail

# --- Configuration ---
FIREFOX_CONFIG_DIR="$HOME/.config/mozilla/firefox"
PROFILES_INI="$FIREFOX_CONFIG_DIR/profiles.ini"
REMOTE_HOST="koljasha"
REMOTE_DIR="~/zip/bookmarks/"
SSH_OPTS="-o BatchMode=yes -o ConnectTimeout=30"

# --- Logging ---
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"
}

# --- Find profile ---
find_profile_path() {
    if [[ ! -f "$PROFILES_INI" ]]; then
        log "ERROR: profiles.ini file not found in $PROFILES_INI"
        exit 1
    fi

    local profile_path
    profile_path="$FIREFOX_CONFIG_DIR/$(grep 'Default' "$PROFILES_INI" | head -1 | cut -d'=' -f2)"

    if [[ -z "$profile_path" ]]; then
        log "ERROR: Failed to find profile with Default=1 in profiles.ini"
        exit 1
    fi

    echo "$profile_path"
}

# --- Main logic ---
main() {
    log "Starting Firefox Bookmarks task..."

    # 1. Get profile path
    PROFILE_PATH=$(find_profile_path)
    BACKUP_SOURCE="$PROFILE_PATH/bookmarkbackups/"

    log "Profile found: $PROFILE_PATH"
    log "Source: $BACKUP_SOURCE"

    # 2. Check source directory existence
    if [[ ! -d "$BACKUP_SOURCE" ]]; then
        log "ERROR: Directory not found: $BACKUP_SOURCE"
        log "Perhaps Firefox has not created any bookmark backups yet."
        exit 1
    fi

    # 3. Execute rsync
    # --delete deletes files on the server that are not locally available
    # -a preserves permissions and attributes
    # -z compresses data during transfer
    log "Starting synchronization with $REMOTE_HOST..."

    # Important: the slash at the end of $BACKUP_SOURCE/ means "contents of the folder"
    rsync -avz --delete --timeout=30 -e "ssh $SSH_OPTS" "$BACKUP_SOURCE" "$REMOTE_HOST:$REMOTE_DIR"

    if [[ $? -eq 0 ]]; then
        log "SUCCESS: Synchronization completed successfully."
    else
        log "ERROR: rsync error (exit code: $?)"
        exit 1
    fi
}

main
