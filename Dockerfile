FROM docker.io/library/fedora:latest

RUN dnf -y update && \ 
    dnf -y install git \
                   hostname \
                   net-tools \
                   procps-ng \
                   python3-pip \
                   which \
    && dnf clean all
RUN pip3 install websockify 
RUN git clone https://github.com/novnc/novnc
RUN ln -sf /novnc/vnc.html /novnc/index.html
ENTRYPOINT /novnc/utils/novnc_proxy --vnc localhost:5901
