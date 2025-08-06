FROM almalinux:9

# EPEL deposunu əlavə et (bəzi paketlər üçün lazım ola bilər)
RUN dnf -y install epel-release && \
    dnf -y install sudo vim curl git net-tools iproute procps-ng passwd && \
    dnf clean all

# Gitpod istifadəçisi yarat
RUN useradd -m gitpod && echo "gitpod:gitpod123" | chpasswd
RUN echo "gitpod ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER gitpod
WORKDIR /home/gitpod


