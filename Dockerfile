FROM osrf/ros:noetic-desktop-full

RUN apt-get update && apt-get install -y \
    zsh \
    wget \
    git \
    curl \
    vim \
    tmux \
    python3-rosdep \
    python-is-python3 \
    emacs python3-jinja2 \
    python3-wstool \
    python3-pip \
    libgeographic-dev \
    geographiclib-tools \
    python3-catkin-tools \
    libusb-dev libsuitesparse-dev ros-noetic-geographic-msgs ros-noetic-serial ros-noetic-rosmon ros-noetic-jsk-rviz-plugins ros-noetic-joy libglfw3-dev libblosc-dev libopenexr-dev liblog4cplus-dev libpcap-dev opencl-headers ros-noetic-gazebo-ros-pkgs ros-noetic-gazebo-ros-control ros-noetic-rqt-gui ros-noetic-rqt-gui-py libgstreamer-plugins-base1.0-dev

RUN apt-get install -y net-tools

# create user airlab
RUN useradd -ms /bin/bash airlab
WORKDIR /home/airlab
# create workspace

USER airlab
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# activate zsh
RUN /bin/zsh -c "source ~/.zshrc"
RUN echo "source /opt/ros/noetic/setup.zsh" >> ~/.zshrc
# install auto suggestions
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# replace plugins line with the following
RUN sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions)/g' ~/.zshrc
# replace ZSH_THEME with the following
RUN sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="crcandy"/g' ~/.zshrc

