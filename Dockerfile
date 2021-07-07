FROM docker.io/library/fedora:latest

RUN dnf -y update && \ 
    dnf -y install git \
                   hostname \
                   net-tools \
                   procps-ng \
                   python3-pip \
                   python3-websockify \
                   which \
    && dnf clean all
RUN git clone https://github.com/novnc/novnc
RUN ln -sf /novnc/vnc.html /novnc/index.html
ENTRYPOINT /novnc/utils/launch.sh --vnc localhost:5901
