# Custom Rom Build #
This is the Custom Rom build guide for Redmi Note 11 (spes/spesn)

```bash

#Requirements
1. A cloud server
2. Minimum 8-core & 16 GB RAM
3. 500 GB+ storage
4. Device: Redmi Note 11
5. Codename: spes/spesn
6. Stable internet connection
7. OS Ubuntu 20.4 LTS or latest

```

## Build Environment ##

Installing required packages

OS: Ubuntu 18.04 and higher

Version: 64-bit

```bash

sudo apt-get install git-core gnupg flex bison build-essential zip curl zlib1g-dev libc6-dev-i386 libncurses5 x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig

```
<br>

Setting Up Build Environment

```bash

sudo su

```


```bash

add-apt-repository ppa:openjdk-r/ppa && apt-get update && sudo apt-get install git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 libncurses5 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig && exit

```
<br>

Cloning Akhil Narang Scripts

```bash

mkdir ~/bin && PATH=~/bin:$PATH && cd ~/bin && curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo && chmod a+x ~/bin/repo && git clone https://github.com/akhilnarang/scripts.git scripts && cd scripts && bash setup/android_build_env.sh && cd

```
Directly Copy Paste these commands


## Device Tree ##

```bash
#Device tree contains

1. device_xiaomi_spes
2. kernel_xiaomi_spes
2. vendor_xiaomi_spes

Here spes is my device codename
It varies phone to phone

```
