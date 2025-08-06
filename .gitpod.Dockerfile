FROM rockylinux:9

RUN dnf -y install \
    sudo \
    vim \
    curl \
    net-tools \
    iproute \
    procps-ng \
    && dnf clean all

USER root

