#!/bin/sh
set -e

sudo dnf -y install libxcrypt-compat xterm

sudo tar xvf data.tar.xz -C /

sudo tar xvf control.tar.xz

sudo sh postinst

sudo systemctl enable --now vncserver-x11-serviced
