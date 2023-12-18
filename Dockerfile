# syntax=docker/dockerfile:1

FROM ros:noetic-robot
RUN useradd -m -s /bin/zsh dev && \
    mkdir -p /home/dev && \
    chown -R dev:dev /home/dev
RUN echo 'dev ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN apt-get update && apt-get install -y \
    zsh \
    wget \
    git \
    curl \
    vim \
    tmux
USER dev
WORKDIR ~/
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)" -- \
-t avit
RUN zsh