#!/bin/bash -eux

cd /tmp

echo '==> Downloading Archlinux'
curl -L -O http://os.archlinuxarm.org/os/ArchLinuxARM-rpi-3-latest.tar.gz

echo '==> Extract tarball'
bsdtar -xpf /tmp/ArchLinuxARM-rpi-3-latest.tar.gz -C /mnt/root
sync

echo '==> Moving boot files'
mv /mnt/root/boot/* /mnt/boot

echo '==> Copying boot files'
cp /mnt/boot/Image /tmp
cp /mnt/boot/initramfs-linux-fallback.img /tmp
