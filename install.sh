#!/bin/sh
set -e

sudo dnf -y install libxcrypt-compat xterm

if [ ! -d "/opt/vc" ]; then
  sudo mkdir -p /opt/vc
  sudo tar xvf pifirmware_libs.tar.gz -C /opt/vc/
else
  echo "/opt/vc exists, moving on"
fi

if [ ! -f "/opt/vc/lib/libvcos.so" ] || [ ! -f "/usr/lib64/libvcos.so.0" ] || [ ! -f "/opt/vc/lib/libvchiq_arm.so" ] || [ ! -f "/usr/lib64/libvchiq_arm.so.0" ] || [ ! -f "/opt/vc/lib/libbcm_host.so" ] || [ ! -f "/usr/lib64/libbcm_host.so.0" ]; then
  sudo ln -s /opt/vc/lib/libvcos.so /usr/lib64/libvcos.so.0
  sudo ln -s /opt/vc/lib/libvchiq_arm.so /usr/lib64/libvchiq_arm.so.0
  sudo ln -s /opt/vc/lib/libbcm_host.so /usr/lib64/libbcm_host.so.0
else
  echo "libvcos.so, libvchiq_arm, libbcm_host sym links already exists so moving on..."
fi

sudo tar xvf data.tar.xz -C /

sudo tar xvf control.tar.xz

sudo sh postinst

sudo systemctl enable --now vncserver-x11-serviced
