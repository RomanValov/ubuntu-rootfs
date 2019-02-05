FROM ubuntu:bionic

ADD http://cloud-images.ubuntu.com/releases/bionic/release/ubuntu-18.04-server-cloudimg-amd64.manifest ubuntu.manifest
RUN sed -i "/\b\grub-\b/d" ubuntu.manifest

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    $(awk '{print $1'} ubuntu.manifest) \
    && rm -rf /var/lib/apt/lists/*

RUN echo "root:passworD1" | chpasswd
