FROM ghcr.io/linuxserver/baseimage-rdesktop:bionic

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thelamer"

RUN \
  echo "**** install packages ****" && \
  add-apt-repository ppa:sergio-br2/vbam-trunk -y && apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
  apt-get install --no-install-recommends -y \
    vbam \
    wget \
    xterm && \
  echo "**** cleanup ****" && \
  apt-get autoclean && \
  rm -rf \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /tmp/*

# add local files
COPY /root /

RUN wget "https://github.com/hxh-robb/pokemon-roms/raw/master/ROM/Pokemon%20-%20Yellow%20Version%20(USA%2C%20Europe).gbc" -O rom.gbc


# ports and volumes
EXPOSE 3389
VOLUME /config
