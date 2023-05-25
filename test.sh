#!/bin/sh
set -e

sudo dnf -y install libxcrypt-compat xterm

if [ ! -d /opt/vc ]; then
echo "Creating /opt/vc directory..."
sudo mkdir /opt/vc
echo "/opt/vc directory created."
echo "Running sudo tar xvf pifirmware_libs.tar.gz -C /opt/vc/..."
sudo tar xvf pifirmware_libs.tar.gz -C /opt/vc/
echo "sudo tar xvf pifirmware_libs.tar.gz -C /opt/vc/ completed."
else
echo "/opt/vc directory already exists."
fi

if [ ! -d /opt/vc/lib/libvcos.so /usr/lib64/libvcos.so.0 /opt/vc/lib/libvchiq_arm.so /usr/lib64/libvchiq_arm.so.0 /opt/vc/lib/libbcm_host.so /usr/lib64/libbcm_host.so.0 ]; then
echo "Creating symlinks..."
sudo ln -s /opt/vc/lib/libvcos.so /usr/lib64/libvcos.so.0
sudo ln -s /opt/vc/lib/libvchiq_arm.so /usr/lib64/libvchiq_arm.so.0
sudo ln -s /opt/vc/lib/libbcm_host.so /usr/lib64/libbcm_host.so.0
echo "Symlinks created."
else
echo "Symlinks already exist."
fi

sudo tar xvf data.tar.xz -C /

sudo tar xvf control.tar.xz

sudo sh postinst

sudo systemctl enable --now vncserver-x11-serviced
