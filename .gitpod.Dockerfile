FROM rockylinux:9

# Əsas paketlərin quraşdırılması
RUN dnf -y update && \
    dnf -y install epel-release && \
    dnf -y install sudo vim git net-tools iproute procps-ng passwd wget tar gzip && \
    dnf -y groupinstall "Development Tools" && \
    dnf clean all

# GitPod istifadəçisi üçün tənzimləmələr
RUN useradd -m gitpod && echo "gitpod:gitpod123" | chpasswd && \
    echo "gitpod ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# İş qovluğu və istifadəçi təyini
USER gitpod
WORKDIR /home/gitpod
ENV HOME=/home/gitpod

# Remove existing gitpod group if it exists (to prevent GID conflict)
RUN groupdel gitpod || true
