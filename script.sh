#!/bin/bash
#tmpfs
mkdir /crdroid
mount /dev/sdc1 /crdroid 
#requirements
apt update && apt upgrade -y
apt install git git-lfs curl wget python-is-python3 sudo nano nload -y
sudo apt install bc bison build-essential ccache curl flex g++-multilib gcc-multilib git git-lfs gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-gtk3-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev -y
apt-get install git-core gnupg flex bison build-essential zip curl zlib1g-dev libc6-dev-i386 x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig -y
#repo
curl https://storage.googleapis.com/git-repo-downloads/repo > /bin/repo
chmod +x /bin/repo
git config --global color.ui true
git config --global user.name "Gokul Santhosh"
git config --global user.email "gokulsanthosh.xyz@gmail.com"
#repo init
cd /crdroid
repo init -u https://github.com/crdroidandroid/android.git -b 14.0 --git-lfs --depth=1
repo sync -j16
repo init -u https://github.com/crdroidandroid/android.git -b 14.0 --git-lfs
mkdir .repo/local_manifests
curl https://raw.githubusercontent.com/Mi-Thorium/local_manifests/refs/heads/master/lineage-21.0.xml -o .repo/local_manifests/device.xml
curl https://tmpfiles.org/dl/16774895/default.xml -o .repo/local_manifests/kernel.xml
repo sync -j16
#build
export USE_CCACHE=1
. build/envsetup.sh
brunch Tiare_4_19
