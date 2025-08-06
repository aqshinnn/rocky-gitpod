FROM almalinux:9

RUN dnf -y install --allowerasing \
    sudo \
    vim \
    curl \
    net-tools \
    iproute \
    procps-ng \
    && dnf clean all

USER root

