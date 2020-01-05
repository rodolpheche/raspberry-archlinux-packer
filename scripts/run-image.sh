#!/bin/bash

qemu-system-aarch64 -M virt -cpu cortex-a53 -smp 4 -m 1024M -serial stdio \
  -kernel dist/Image \
  -initrd dist/initramfs-linux-fallback.img \
  -drive if=none,file=dist/archlinux-vm,format=raw,id=hd \
  -device virtio-blk-device,drive=hd \
  -netdev user,id=mynet \
  -device virtio-net-device,netdev=mynet \
  -append "root=/dev/vda2 rw loglevel=3 elevator=deadline fsck.repair=yes net.ifnames=0 rootwait"
