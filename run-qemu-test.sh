#!/bin/bash

set -ex

rm -f ubuntu.img ubuntu.tar

docker build --tag ubuntu-rootfs .
container=$(docker create ubuntu-rootfs)
docker export --output=ubuntu.tar $container
docker rm $container

sudo virt-make-fs --partition --format=qcow2 --size=+500M ubuntu.tar ubuntu.img
sudo chown $USER ubuntu.img
rm ubuntu.tar

sudo qemu-nbd -d /dev/nbd0
sudo modprobe nbd max_part=16
sudo qemu-nbd -c /dev/nbd0 ubuntu.img
sudo mount /dev/nbd0p1 /mnt
sudo grub-install --root-directory=/mnt /dev/nbd0
sudo umount /mnt
sudo qemu-nbd -d /dev/nbd0

qemu-system-x86_64 ubuntu.img
rm ubuntu.img
