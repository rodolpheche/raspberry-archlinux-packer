#!/bin/bash -eux

echo '==> Create first-boot service'
cat <<EOF > /mnt/root/usr/lib/systemd/system/first-boot.service
[Unit]
ConditionPathExists=!/opt/first-boot-done

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/opt/first-boot.sh
StandardOutput=kmsg+console

[Install]
WantedBy=multi-user.target
EOF

echo '==> Enable first-boot service'
ln -s /mnt/root/usr/lib/systemd/system/first-boot.service /mnt/root/etc/systemd/system/multi-user.target.wants/first-boot.service

echo '==> Copy post-install scripts'
mv /tmp/first-boot.sh /mnt/root/opt
