FROM almalinux:9

RUN dnf -y install sudo vim curl git net-tools iproute procps-ng passwd && dnf clean all

RUN useradd -m gitpod && echo "gitpod:gitpod123" | chpasswd
RUN echo "gitpod ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER gitpod
WORKDIR /home/gitpod



