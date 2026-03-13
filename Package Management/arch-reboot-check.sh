#!/usr/bin/env bash

kernelname="$(grep -oP '\(\K.*(?=@.*\))' /proc/version)"

_notify() {
    local header="System Update"
    local title="Reboot Recommended"
    local msg="Core package(s) were updated. Please reboot your system for a smooth experience."

    echo "==> INFO: $msg" >&2

    for user in $(users | sed 's| |\n|g' | sort | uniq); do
        # We added 'sound-name' to the hints dictionary below
        busctl --machine="${user}@.host" --user call org.freedesktop.Notifications \
            /org/freedesktop/Notifications \
            org.freedesktop.Notifications  \
            Notify susssasa\{sv\}i \
            "$header" \
            0 \
            system-reboot \
            "$title" \
            "$msg" \
            0 \
            2 urgency y 2 sound-name s "message-new-instant" \
            10000 &>/dev/null
    done
    exit 0
}

while read -r target; do
    case "$target" in
        "$kernelname") _notify;;
        nvidia|nvidia-open*) _notify;;
        nvidia-dkms|nvidia-open-dkms) _notify;;
        btrfs-progs) [ -n "$(mount -t btrfs)" ] && _notify || : ;;
        xfsprogs) [ -n "$(mount -t xfs)" ] && _notify || : ;;
        e2fsprogs) [ -n "$(mount -t ext4)" ] && _notify || : ;;
        *) _notify ;;
    esac
done
