# syntax=docker/dockerfile:1

FROM ros:noetic-robot

# Install necessary tools and zsh
RUN apt-get update && apt-get install -y \
    zsh \
    wget \
    git \
    curl \
    vim \
    tmux

# Install required packages and set up the 'dev' user
RUN useradd -m -s /bin/zsh dev && \
    mkdir -p /home/dev && \
    chown -R dev:dev /home/dev && \
    echo 'dev ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Switch to the 'dev' user
USER dev
WORKDIR /home/dev

# Install zsh-in-docker
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)" -- -t avit

# Set zsh as the default shell
SHELL ["/bin/zsh", "--login", "-c"]
