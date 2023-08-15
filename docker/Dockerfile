FROM ubuntu:22.04

USER root
SHELL ["/bin/bash", "-c"]

RUN \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    export TZ=Europe/Stockholm && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN \
    apt-get update && \
    apt-get -y install git curl vim wget python3 procps tree sudo less && \
    apt-get -y install iproute2 iputils-ping iputils-tracepath

RUN \
    apt-get update && \
    apt-get -y install certbot haproxy haproxy-log-analysis haproxyctl

RUN \
    rm -rf /etc/haproxy/haproxy.cfg
COPY \
    conf/rootfs /
    
RUN \
    useradd -m -s /bin/bash -g staff -G sudo maker && \
    passwd -d maker

RUN \
    chown -R root:root /etc /script
    
WORKDIR /var/lib

CMD ["bash", "/script/startup.sh"]
