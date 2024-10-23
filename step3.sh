#!/bin/bash
    
# Must be run with root permissions 
# sudo will be sufficient
echo "Смотрим текущее состояние системы (список Volume Group)"
sudo vgs

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

newhostname=ubuntu-otus
oldhostname=vg0

echo "Changing LVM names"
newvg=${newhostname//-}

# Find the volume group that root is in 
vg=`lvdisplay -C|awk '$1=="root" {print $2}'`
if [[ ${vg} == *"-"* ]]; then
    #has dashes in current name
    vgrename ${vg} ${newhostname//-}
    vg=`echo $vg|sed "s/-/--/g"`
    sed -i "s/${vg}/${newvg}/g" /etc/fstab
    sed -i "s/${vg}/${newvg}/g" /boot/grub/grub.cfg
  else
    #no dashes in current name
    vgrename ${vg} ${newvg}
    sed -i "s/${vg}/${newvg}/g" /etc/fstab
    sed -i "s/${vg}/${newvg}/g" /boot/grub/grub.cfg
fi

update-initramfs -c -k all

