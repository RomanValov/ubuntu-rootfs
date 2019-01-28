FROM ubuntu:bionic

RUN apt-get update && apt-get install -y \
    init \
    systemd \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

RUN echo "root:passworD1" | chpasswd
