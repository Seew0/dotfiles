#!/bin/bash

fdisk /dev/sda
reflector --latest 50 --sort rate --save /etc/pacman.d/mirrorlist
mkfs.ext4 /dev/sda2
mkfs.fat -F 32 /dev/sda1
mount /dev/sda2 /mnt
mkdir -p /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi
pacstrap /mnt base linux base-devel vim linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
curl -LO raw.githubusercontent.com/Seew0/minimal-arch-linux/main/user
cp user /mnt/root
echo "Copied file in root"
arch-chroot /mnt sh /root/user
rm /mnt/root/user
umount -a
reboot
