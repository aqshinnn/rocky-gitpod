FROM almalinux:9

RUN dnf -y install epel-release && \
    dnf -y install sudo vim git net-tools iproute procps-ng passwd && \
    dnf -y remove curl-minimal && \
    dnf -y install curl --allowerasing && \
    dnf clean all

RUN useradd -m gitpod && echo "gitpod:gitpod123" | chpasswd
RUN echo "gitpod ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER gitpod
WORKDIR /home/gitpod

