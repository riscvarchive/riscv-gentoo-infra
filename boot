#!/bin/bash

qemu-system-riscv \
    -kernel generated/vmlinux \
    -nographic \
    -netdev user,id=net0 -device virtio-net-device,netdev=net0 \
    -device virtio-scsi-device -drive file=generated/scratch.img,format=raw,id=hd0 -device scsi-hd,drive=hd0 \
    -chardev pty,id=tty0 -device virtio-serial-device -device virtserialport,chardev=tty0
