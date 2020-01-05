#!/bin/bash -eux

echo '==> Mounting partitions'
mkdir /mnt/boot /mnt/root
mount /dev/vda1 /mnt/boot
mount /dev/vda2 /mnt/root
