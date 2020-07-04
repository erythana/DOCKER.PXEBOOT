# DOCKER.PXEBOOT
Simple Docker-Image for setting up a PXE-Boot Environment based on Ubuntu

### Install:
 - To install, simply run the following command:
   ```
   sudo docker-compose -f pxeboot.yml up
   ```
   This will create the two volumes in the same folder where the pxeboot.yml is located. To alter the boot environment, modify the `default` file in etc-pxeboot and the images in images-pxeboot accordingly.

- After changing stuff you need to restart the docker container, like this:
```
sudo docker restart pxeboot
```

### DHCP-Configuration:
As this is a pure PXE(/TFTP)-Environment you need to set up your own DHCP Server with according settings. You need to point the boot options to the correct ip adress of the docker-host running this container. Replace the IPs below with your own!
In my example im using dnsmasq as DHCP and DNS Server in my network. To configure this boot options, just add a new file, for example `10-tftp.conf` to your `/etc/dnsmasq.d/` directory with the following contents:
```
    dhcp-option=66,"192.168.0.234"
    dhcp-boot=pxelinux.0,192.168.0.234
```

#### Remarks:
Please note, Clonezilla is not included as a sample image, but the (`default`)boot menu still lists it. To get it running just copy the required files into a       `images-pxeboot\clonezilla` folder, basically just check the configuration from the file. Everything is documented at the clonezilla page anyway.
