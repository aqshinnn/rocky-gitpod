FROM almalinux:9

# Lazımi paketləri quraşdır
RUN dnf -y install --allowerasing \
    sudo \
    vim \
    curl \
    git \
    net-tools \
    iproute \
    procps-ng \
    passwd \
    && dnf clean all

# Yeni istifadəçi yaradılır və parolu təyin edilir
RUN useradd -m gitpod && echo "gitpod:gitpod123" | chpasswd

# İstifadəçiyə sudo icazəsi verilir (şifrə soruşulmadan)
RUN echo "gitpod ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Default istifadəçi və iş qovluğu
USER gitpod
WORKDIR /home/gitpod


