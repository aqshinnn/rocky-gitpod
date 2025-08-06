FROM rockylinux:9

# Əsas paketlərin quraşdırılması
RUN dnf -y update && \
    dnf -y install epel-release && \
    dnf -y install sudo vim git net-tools iproute procps-ng passwd curl wget tar gzip && \
    dnf -y groupinstall "Development Tools" && \
    dnf clean all

# GitPod istifadəçisi üçün tənzimləmələr
RUN useradd -m gitpod && echo "gitpod:gitpod123" | chpasswd && \
    echo "gitpod ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# İş qovluğu və istifadəçi təyini
USER gitpod
WORKDIR /home/gitpod
ENV HOME=/home/gitpod
