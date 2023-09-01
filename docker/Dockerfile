FROM ubuntu:22.04

USER root
SHELL ["/bin/bash", "-c"]

RUN \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    export TZ=UTC && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN \
    apt-get update && \
    apt-get -y install curl vim wget python3 procps tree sudo less && \
    apt-get -y install iproute2 iputils-ping iputils-tracepath

RUN \
    apt-get -y install apt-transport-https gnupg2 curl lsb-release && \
    curl -sL 'https://deb.dl.getenvoy.io/public/gpg.8115BA8E629CC074.key' | sudo gpg --dearmor -o /usr/share/keyrings/getenvoy-keyring.gpg && \
    echo a077cb587a1b622e03aa4bf2f3689de14658a9497a9af2c427bba5f4cc3c4723 /usr/share/keyrings/getenvoy-keyring.gpg | sha256sum --check && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/getenvoy-keyring.gpg] https://deb.dl.getenvoy.io/public/deb/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/getenvoy.list && \
    apt-get update && \
    apt-get install -y getenvoy-envoy

RUN \
    apt-get update && \
    apt-get install -y certbot

RUN \
    rm -rf /usr/share/doc/getenvoy-envoy
COPY \
    conf/rootfs /
    
RUN \
    useradd -m -s /bin/bash -g staff -G sudo maker && \
    passwd -d maker

RUN \
    chown -R root:root /etc /script
    
WORKDIR /var/lib

CMD ["bash", "/script/startup.sh"]
