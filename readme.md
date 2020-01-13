# Raspberry Archlinux

Build & Deploy Archlinux image on Raspberry PI 3B+ with Docker preinstalled

## Requirements

- [packer](https://www.packer.io/docs/install/index.html)
- [qemu](https://www.qemu.org/download/)

Note : You may install these dependencies with [Nix](https://nixos.org/nix/)

## Getting started

### Build image

```bash
packer build packer.json
```

### Burn image

```bash
dd if=dist/archlinux-vm of=/dev/mmcblk0 bs=4M status=progress
```
