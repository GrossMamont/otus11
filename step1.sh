#!/bin/bash

sudo apt update
sudo apt install -y mc
echo "Смотрим конфигурацию загрузчика"
sudo cat /etc/default/grub
echo "Смотрим /boot/grub/grub.cfg"
sudo cat /boot/grub/grub.cfg
echo "Смотрим /etc/default/grub"
sudo cat /etc/default/grub
