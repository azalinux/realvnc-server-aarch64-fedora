# realvnc-server-aarch64-fedora

******** Still Testing - BETA ******

RealVNC Server Version:    6.7.2.43081

This repository is for installing RealVNC Server ARM64 edition on Fedora 33+ Workstation or Server for your Raspberry Pi device. Has been tested using a Pi4 with 8gb RAM and on multiple desktop environments including XFCE, GNOME, LXQT & Plasma.

**INSTALLATION**

To install, clone the git respository and use the included install script:

$ sudo dnf install git

$ git clone https://github.com/azalinux/realvnc-server-aarch64-fedora

$ ./install.sh


No activation key is needed if using on a Raspberry Pi device. ** This is intended for Personal Use only! **
I may produce a RPM binary at some point in the future however at this stage a manual install script will suffice.

**Known Issues**

I recommend you disable SElinux as it will interfer with some operational parts of RealVNC server.  If you feel the need to have SELinux enabled, you will need to run this command to setup the SElinux exceptions for RealVNC:

$ sudo ./vncinitconfig -register-SELinux
