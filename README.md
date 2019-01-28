# ubuntu-rootfs

A base Ubuntu rootfs image designed to be bootable in a VM rather than simply a container.

## Usage

May be used with Dockerized [qemu-rootfs](https://github.com/josh/qemu-rootfs) runner.

```
$ docker build --tag qemu-ubuntu - <<EOF
FROM joshpeek/ubuntu-rootfs as rootfs

# Customize your rootfs
RUN apt-get update && apt-get install -y curl

FROM joshpeek/qemu-rootfs
COPY --from=rootfs / /rootfs
EOF

$ docker run --rm -it qemu-ubuntu
```

## Testing

Requires Ubuntu.

```sh
$ sudo apt-get install qemu libguestfs-tools
$ git clone https://github.com/josh/ubuntu-rootfs
$ cd ubuntu-rootfs/
$ ./run-qemu-test.sh
```
