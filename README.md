# ubuntu-rootfs

A base Ubuntu rootfs image designed to be bootable in a VM rather than simply a container.

## Testing

Requires Ubuntu.

```sh
$ sudo apt-get install qemu libguestfs-tools
$ git clone https://github.com/josh/ubuntu-rootfs
$ cd ubuntu-rootfs/
$ ./run-qemu-test.sh
```
