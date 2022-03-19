#!/bin/bash

USERNAME="seew"
HOSTNAME="arch"
PASSWORD="pass"
sed -i '178s/.//' /etc/locale.gen
locale-gen
echo "root:$PASSWORD" | chpasswd
echo $HOSTNAME >> /etc/hostname
pacman -S linux-headers networkmanager efibootmgr grub mtools openssh polkit git dosfstools os-prober --noconfirm

grub-install --target=x86_64-efi --bootloader-id=grub_uefi --efi-directory=/boot/efi --recheck
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager

useradd -m $USERNAME
echo "$USERNAME:$PASSWORD" | chpasswd

echo "$USERNAME ALL=(ALL) ALL" >> /etc/sudoers.d/$USERNAME

echo "Completed!"

