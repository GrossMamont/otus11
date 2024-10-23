#!/bin/bash

echo "Обновляем конфигурацию загрузчика и перезагружаемся для проверки"
sudo update-grub
sudo cat /etc/default/grub
echo "Смотрим /boot/grub/grub.cfg"
sudo cat /boot/grub/grub.cfg

