FROM rockylinux:9

# Əsas paketlərin quraşdırılması
RUN dnf -y update && \
    dnf -y install epel-release && \
    dnf -y install sudo vim git net-tools iproute procps-ng passwd wget tar gzip && \
    dnf -y groupinstall "Development Tools" && \
    dnf clean all

# GitPod istifadəçisi üçün tənzimləmələr
RUN useradd -m adm && echo "adm:adm123" | chpasswd && \
    echo "adm ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# İş qovluğu və istifadəçi təyini
USER admroot
WORKDIR /home/adm
ENV HOME=/home/adm



