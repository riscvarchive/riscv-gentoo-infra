#!/bin/busybox sh
set -xe

mount -t devtmpfs none /dev
mount -t proc none /proc
mount -t sysfs none /sys

# Install all the busybox sym links
/bin/busybox --install

mount -t ext4 /dev/htifblk0 /mnt/ || /bin/busybox ash

# If it works then go ahead and try to enter the new root
mkdir -p /mnt/proc
mkdir -p /mnt/sys
mkdir -p /mnt/dev
mount -t proc none /mnt/proc
mount -t sysfs none /mnt/sys
mount -t devtmpfs none /mnt/dev

# Make sure to set the date to something kind of reasonable -- this
# appears necessary in order to make the boot process kind of work...
busybox date 012200002015

exec busybox switch_root /mnt /sbin/init || /bin/busybox ash

sync
halt -f
