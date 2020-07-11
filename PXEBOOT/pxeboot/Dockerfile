FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive

LABEL maintainer="erythana"
LABEL version="1.0"
LABEL description="Simple Docker-Image with TFTPD-PXE Boot based on Ubuntu"

RUN \
  echo "*** installing required packages ***" && \
  apt-get update && \
  apt-get install -y apt-utils && apt-get install -y dialog tftpd-hpa pxelinux syslinux-common syslinux-efi

RUN \
  echo "*** cleaning up installation ***" && \
  rm -rf /var/lib/apt/lists/* && \
    apt-get clean

WORKDIR /var/lib/tftpboot
RUN \
  echo "*** copying syslinux-files and creating required folders ***" && \
  mkdir --p /var/lib/tftpboot/bios && \
  mkdir --p /var/lib/tftpboot/efi32 && \
  mkdir --p /var/lib/tftpboot/efi64 && \
  mkdir --p /var/lib/tftpboot/pxelinux.cfg && \
  mkdir --p /var/lib/tftpboot/etc-pxeboot && \
  mkdir --p /var/lib/tftpboot/images-pxeboot && \
  echo "*** copying bios files to directory ***" && \
  cp /usr/lib/syslinux/modules/bios/* /var/lib/tftpboot/bios/ && \
  cp /usr/lib/PXELINUX/pxelinux.0 /var/lib/tftpboot/bios/ && \ 
  echo "*** copying uefi32 files to directory ***" && \
  cp /usr/lib/syslinux/modules/efi32/* /var/lib/tftpboot/efi32/ && \
  cp /usr/lib/SYSLINUX.EFI/efi32/syslinux.efi /var/lib/tftpboot/efi32/bootia32.efi && \
  echo "*** copying uefi64 files to directory ***" && \
  cp /usr/lib/syslinux/modules/efi64/* /var/lib/tftpboot/efi64/ && \
  cp /usr/lib/SYSLINUX.EFI/efi64/syslinux.efi /var/lib/tftpboot/efi64/bootx64.efi && \
  echo "*** creating sym-links to boot-config ***" && \
  ln -s ../pxelinux.cfg bios/pxelinux.cfg && \
  ln -s ../pxelinux.cfg efi32/pxelinux.cfg && \
  ln -s ../pxelinux.cfg efi64/pxelinux.cfg
RUN \
  echo "*** copying a default-menu to the newly created folder ***"
COPY starttftp.sh .
RUN \
  echo "*** starting the tftp server *** "

CMD ["bash", "/var/lib/tftpboot/starttftp.sh"]
