#!/bin/bash -eux

echo '==> Setup fstab'
cat <<EOF > /mnt/root/etc/fstab
# <fs>       <mountpoint>    <type>    <opts>      <dump/pass>
/dev/mmcblk0p2    /               ext4      nofail,auto,defaults    0 0
/dev/mmcblk0p1    /boot           vfat      nofail,auto,defaults    0 0
/dev/vda2         /               ext4      nofail,auto,defaults    0 0
/dev/vda1         /boot           vfat      nofail,auto,defaults    0 0
EOF
