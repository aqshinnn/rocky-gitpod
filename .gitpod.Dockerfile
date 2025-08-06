FROM almalinux:9

# EPEL deposunu əlavə et və əsas paketləri yüklə
RUN dnf -y install epel-release && \
    dnf -y install sudo vim git net-tools iproute procps-ng passwd && \
    dnf -y remove curl-minimal && \
    dnf -y install curl --allowerasing && \
    dnf clean all

# Yeni istifadəçi yarat və şifrə təyin et
RUN useradd -m gitpod && echo "gitpod:gitpod123" | chpasswd
RUN echo "gitpod ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Gitpod-un istifadəçi olaraq işləməsi üçün ayarlar
USER gitpod
WORKDIR /home/gitpod


