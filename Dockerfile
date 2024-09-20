FROM osrf/ros:humble-desktop-full

RUN apt-get update && apt-get install -y \
    zsh \
    wget \
    git \
    curl \
    vim \
    tmux \
    emacs python3-jinja2 \
    python3-wstool \
    python3-pip \
    libgeographic-dev \
    geographiclib-tools \
    libusb-dev libsuitesparse-dev

RUN apt-get install -y net-tools
RUN apt-get install -y openssh-server
# create user airlab
RUN useradd -ms /bin/bash lecar
# set password for user airlab
RUN echo 'lecar:lecar' | chpasswd
# add user airlab to sudo group
RUN usermod -aG sudo lecar
# set user airlab as sudo user
RUN echo "lecar ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
# set user airlab as default user
WORKDIR /home/lecar
# create workspace

USER lecar
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# activate zsh
RUN /bin/zsh -c "source ~/.zshrc"
RUN echo "source /opt/ros/humble/setup.zsh" >> ~/.zshrc
# install auto suggestions
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# replace plugins line with the following
RUN sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions)/g' ~/.zshrc
# replace ZSH_THEME with the following
RUN sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="crcandy"/g' ~/.zshrc

