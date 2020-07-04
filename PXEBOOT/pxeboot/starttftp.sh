#!/bin/bash
cp /var/lib/tftpboot/etc-pxeboot/* /var/lib/tftpboot/pxelinux.cfg/
service tftpd-hpa start && tail -F /dev/null
