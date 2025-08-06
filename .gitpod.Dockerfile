FROM rockylinux:9

RUN dnf -y update && \
    dnf -y install sudo vim curl net-tools iproute procps && \
    dnf clean all

USER root
