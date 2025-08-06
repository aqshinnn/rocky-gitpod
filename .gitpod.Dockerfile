FROM rockylinux:9

# Install base packages (with the curl fix from previous solution)
RUN dnf -y update && \
    dnf -y install epel-release && \
    dnf -y remove curl-minimal && \
    dnf -y install sudo vim git net-tools iproute procps-ng passwd curl wget tar gzip --allowerasing && \
    dnf -y groupinstall "Development Tools" && \
    dnf clean all

# Remove existing gitpod group if it exists (to prevent GID conflict)
RUN groupdel gitpod || true

# Create gitpod group with correct GID
RUN groupadd -g 33333 gitpod

# Create gitpod user with correct UID and primary group
RUN useradd -l -u 33333 -g gitpod -md /home/gitpod -s /bin/bash -p gitpod gitpod

# Add passwordless sudo
RUN echo "gitpod ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Set working directory
WORKDIR /home/gitpod
USER gitpod
ENV HOME=/home/gitpod
