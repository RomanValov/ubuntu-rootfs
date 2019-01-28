#!/bin/bash

set -ex

rm -f ubuntu.img ubuntu.tar

docker build --tag ubuntu-rootfs .

container=$(docker create ubuntu-rootfs)
docker export --output=ubuntu.tar $container
docker rm $container

sudo virt-make-fs ubuntu.tar ubuntu.img
sudo chown $USER ubuntu.img
rm ubuntu.tar

sudo qemu-system-x86_64 \
  -kernel /boot/vmlinuz-$(uname -r) \
  -append "root=/dev/sda rw" \
  -drive file=ubuntu.img,format=raw
rm ubuntu.img
