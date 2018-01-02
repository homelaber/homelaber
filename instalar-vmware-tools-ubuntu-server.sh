## Script para instalar o VMware Tools no Ubuntu
#chmod +x nome do arquivo.sh


 #!/bin/sh
sudo mkdir -p /media/cdrom
sudo mount /dev/cdrom /media/cdrom
sudo cp -v /media/cdrom/VM*.tar.gz /tmp/
sudo tar xzvf /tmp/VM*.tar.gz
sudo mkdir -p /usr/lib64
sudo  ./vmware-tools-distrib/vmware-install.pl -y
sudo rm -r -f -v vmware-tools-distrib/
