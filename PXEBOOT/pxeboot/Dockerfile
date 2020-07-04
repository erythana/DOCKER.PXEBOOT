FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive

LABEL maintainer="erythana"
LABEL version="1.0"
LABEL description="Simple Docker-Image with TFTPD-PXE Boot based on Ubuntu"

RUN \
  echo "*** installing required packages ***" && \
  apt-get update && \
  apt-get install -y apt-utils && apt-get install -y dialog tftpd-hpa pxelinux syslinux-common

RUN \
  echo "*** cleaning up installation ***" && \
  rm -rf /var/lib/apt/lists/* && \
    apt-get clean

RUN \
  echo "*** copying syslinux-files and creating required folders ***" && \
  cp -v /usr/lib/syslinux/modules/bios/ldlinux.c32 /var/lib/tftpboot/ && \
  cp -v /usr/lib/syslinux/modules/bios/libcom32.c32 /var/lib/tftpboot/ && \
  cp -v /usr/lib/syslinux/modules/bios/libutil.c32 /var/lib/tftpboot/ && \
  cp -v /usr/lib/syslinux/modules/bios/vesamenu.c32 /var/lib/tftpboot/ && \
  cp /usr/lib/PXELINUX/pxelinux.0 /var/lib/tftpboot/ && \
  mkdir --p /var/lib/tftpboot/pxelinux.cfg && \
  mkdir --p /var/lib/tftpboot/etc-pxeboot && \
  mkdir --p /var/lib/tftpboot/images-pxeboot


RUN \
  echo "*** copying a default-menu to the newly created folder ***"
WORKDIR /var/lib/tftpboot/pxelinux.cfg
COPY starttftp.sh ../
RUN \
  echo "*** starting the tftp server *** "

CMD ["bash", "/var/lib/tftpboot/starttftp.sh"]
