FROM tiryoh/ros-desktop-vnc:noetic

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



