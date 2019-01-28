FROM ubuntu:bionic

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    init \
    linux-image-virtual \
    systemd \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

RUN echo "root:passworD1" | chpasswd
