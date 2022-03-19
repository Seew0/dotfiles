#!/bin/bash

echo -n "USERNAME: "
read USERNAME
echo -n "HOSTNAME: "
read HOSTNAME
echo -n "PASSWORD: "
read PASSWORD
sed -i '178s/.//' /etc/locale.gen
locale-gen
echo "root:$PASSWORD" | chpasswd
echo $HOSTNAME >> /etc/hostname
pacman -S linux-headers networkmanager grub mtools openssh polkit git dosfstools os-prober --noconfirm

grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager

useradd -m $USERNAME
echo "$USERNAME:$PASSWORD" | chpasswd

echo "$USERNAME ALL=(ALL) ALL" >> /etc/sudoers.d/$USERNAME

echo "Completed!"

