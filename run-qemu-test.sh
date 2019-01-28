#!/bin/bash

set -ex

docker build --tag ubuntu-rootfs .

container=$(docker create ubuntu-rootfs)
docker export --output=ubuntu.tar $container
docker rm $container

sudo virt-make-fs ubuntu-rootfs.tar ubuntu.img
rm ubuntu.tar

sudo qemu-system-x86_64 \
  -kernel /boot/vmlinuz-$(uname -r) \
  -append "root=/dev/sda rw" \
  -hda ubuntu.img
