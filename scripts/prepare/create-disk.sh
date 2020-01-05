#!/bin/bash -eux

echo '==> Creating partitions'
parted --script /dev/vda \
  mklabel msdos \
  mkpart primary fat32 1MiB 100MiB \
  set 1 boot on \
  mkpart primary ext4 100MiB 100%

echo '==> Formating partitions'
mkfs.vfat -F32 /dev/vda1
mkfs.ext4 /dev/vda2
