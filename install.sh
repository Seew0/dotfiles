#!/bin/bash

cfdisk /dev/sda
mkfs.ext4 /dev/sda2
mkfs.fat -F 32 /dev/sda1
mount /dev/sda2 /mnt
mkdir -p /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi
reflector --latest 20 --sort rate --save /etc/pacman.d/mirrorlist
pacstrap /mnt base linux linux-firmware base-devel vim
genfstab -U /mnt >> /mnt/etc/fstab
curl -LO raw.githubusercontent.com/Seew0/minimal-arch-linux/main/user-setup.sh
cp user-setup.sh /mnt/root
echo "Copied file in root"
arch-chroot /mnt sh /root/user-setup.sh
rm /mnt/root/user-setup.sh
umount -a
reboot
