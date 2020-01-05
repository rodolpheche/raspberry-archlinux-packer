#!/bin/bash

mkdir -p test
rm -f test/archlinux-vm

NAME=$1
if [ "$NAME" = "" ]
then
  NAME=archlinux-vm
fi

if [ ! -f test/$NAME ]
then
  cp dist/$NAME test/$NAME
fi

qemu-system-aarch64 -M virt -cpu cortex-a53 -smp 4 -m 1024M -serial stdio \
  -kernel dist/Image \
  -initrd dist/initramfs-linux-fallback.img \
  -drive if=none,file=test/$NAME,format=raw,id=hd \
  -device virtio-blk-device,drive=hd \
  -netdev user,id=mynet \
  -device virtio-net-device,netdev=mynet \
  -append "root=/dev/vda2 rw loglevel=3 elevator=deadline fsck.repair=yes net.ifnames=0 rootwait" # TODO same loglevel inside cmdline
