# Custom Rom Build #
This is the Custom Rom build guide for Redmi Note 11 (spes/spesn)

```bash

#Requirements
1. A cloud server
2. Minimum 8-core & 64 GB RAM
3. Higher specs are better
4. 500 GB+ storage
5. Device: Redmi Note 11
6. Codename: spes/spesn
7. Stable internet connection
8. OS Ubuntu 20.04 LTS or latest
9. Working brain 

```

## Requirements ##

`OS`: Ubuntu 18.04 and higher [Any operating system would do (Debian Recommended)]
`Version`: 64-bit

<b>Installing required packages</b>

```bash
sudo apt-get install git-core gnupg flex bison build-essential zip curl zlib1g-dev libc6-dev-i386 libncurses5 x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig
```
<br>



## Build Environment Script ##

<b>Setting Up Build Environment</b>



<b>`Directly paste this`</b>


```bash

git clone https://github.com/tanvirr007/CustomROM_build_guide_aosp && cd CustomROM_build_guide_aosp && rm -rf README.md && sh setup.sh
```

<b>`or this`</b>

```bash
git clone https://github.com/tanvirr007/CustomROM_build_guide_aosp && cd CustomROM_build_guide_aosp && sh setup.sh
```


<b>`or paste these commands one by one`</b>

```bash
git clone https://github.com/tanvirr007/CustomROM_build_guide_aosp
```

```bash
cd CustomROM_build_guide_aosp

```

```bash
sh setup.sh
```

## Directory Structure ##
```
ROM_NAME/
|-- .repo/
|-- device/
|   |-- (xiaomi)/
|       |-- (spes)/    <-- This is where your device tree goes
|-- vendor/
|   |-- (xiaomi)/
|       |-- (spes)/    <-- This is where your vendor files go
|-- kernel/
|   |-- (xiaomi)/
|       |-- (sm6225)/    <-- This is where your kernel sources go
|-- (other project directories)
```

## Device Tree ##

<b>Device Directory Structure Explanation</b>

1. `device/xiaomi/spes`: This directory contains device-specific configuration files that are unique to the `spes` codenamed Xiaomi device. These files may include details about the device's hardware components, such as the memory layout, peripheral interfaces, and power management settings.


2. `vendor/xiaomi/spes`: This directory contains vendor-specific configuration files that are specific to Xiaomi devices. These files may include proprietary drivers, software modules, and optimizations provided by Xiaomi.


2. `hardware/xiaomi`: This directory contains generic hardware configuration files that are shared across multiple Xiaomi devices. These files may include common hardware abstraction layers (HALs) and device-agnostic configurations.


3. `kernel/xiaomi/sm6225`: This directory contains kernel-specific configuration files that are tailored to the Qualcomm SM6225 as known as [Snapdragon 680](https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdragon-6-series-mobile-platforms/snapdragon-680-4g-mobile-platform) chipset used in the `spes` device. These files may include kernel modules, device drivers, and chipset-specific optimizations.


[SPES](https://www.mi.com/global/product/redmi-note-11/specs) is my device codename
It varies phone to phone


I will use my pre-merged device tree, which contains `vendorsetup.sh`. I've specified the cloning directory for the kernel and vendor trees in the `vendorsetup.sh`, so manual cloning isn't necessary for me. However, if your device tree lacks this file, you'll need to manually clone the `device/vendor/hardware/kernel` trees from GitHub or GitLab into the directory mentioned above.


## Credits ##

Thanks [Anar Jabiyev](https://github.com/Jabiyeff) for device tree

Thanks [Dblenk](https://github.com/boedhack99) for device tree

Thanks [Sayan Sarkar](https://github.com/sayann70) (bro) for base

Thanks [Ascending](https://github.com/TheMatheusDev) (bro) for help

Thanks [Aditya](https://github.com/afterallafk) Bhaiyaa for the guidelines

Thanks [Muralidharan](https://github.com/muralivijay) for Mi680 kernel

Thanks [Akira](https://github.com/AkiraNoSushi) for Mi680 kernel

Thanks [Jashkirat](https://github.com/Jashkirat) for recovery

Thanks [Harshit](https://github.com/iamharshit188) (bro) for base setup/env script

Thanks [ChatGPT](https://chat.openai.com/auth/login) && [Bard](https://bard.google.com) for helping me debugging the rom



## Starting ##

<b>I am going to build LibreMobileOs (LMODroid)</b>

```bash
mkdir rom_name
```

```bash
cd rom_name
```
<br>

<b>Note:</b> Here, `rom_name` means use the rom name that you're going to build or you can choose any kind names whatever the fuck you want

## Clone Rom Source ##

<b>Download/Clone</b> rom manifest from GitHub or GitLab into the `rom_name` folder

<b>Initialize local repository</b>
```bash
repo init -u https://git.libremobileos.com/LMODroid/manifest.git -b thirteen --git-lfs
```

Here,

`-b` stands for `branch`

`thirteen` stands for `branch name`

<br>


<b>Note:</b> Here you can can add `--depth=1` it's optional.
This `--depth=1` in Git means "clone only the latest commit, using less storage and reducing download time." While, it reduces storage and speeds up cloning, it also limits your access to historical changes beyond the specified depth. If you need to access historical changes or work with multiple branches, you should use a full clone instead. It is a good option for situations where you only need to work with the most recent changes in a repository.

`For e.g.`

```bash
repo init -u https://git.libremobileos.com/LMODroid/manifest.git -b thirteen --git-lfs --depth=1
```


<b>Sync</b>
```bash
repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all)
```
 

## Clone Device Tree ##

<b>Download/Clone</b> `Device/Vendor/Hardware/Kernel tree` from GitHub or GitLab into the `rom_name` folder. I'll use my Pre merged Device/Vendor/Hardware/Kernel Tree

```bash

git clone https://github.com/tanvirr007/device_xiaomi_spes -b 14 device/xiaomi/spes
```
<b>Here,</b>

`-b` stands for `branch`

`13` for `branch name`

`device/xiaomi/spes` is the download path
<br>

<b>Now clone this hardware tree</b> 👇

```bash
git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-20 hardware/xiaomi
```

<b>Now navigate to this path</b> 👇

```bash

cd device/xiaomi/spes
```

```bash
ls
```
<b>Note:</b> The `ls` command is a fundamental tool in the Linux operating system used to list the contents of a directory. It is one of the most frequently used commands and is essential for navigating the filesystem.

<br>

## Bring Up ##

Now, you must have to modify these `2` files on device tree named

1. `AndroidProducts.mk`

2. `blaze_spes.mk`

Each rom use `different/same` code names likes

<b>Pixel Experience use:</b> `aosp`

<b>LMODroid use:</b> `lmodroid`

<b>PixelOS use:</b> `aosp`

<b>Project Elixir use:</b> `aosp`

it's available either on their `GitHub` manifest pages or in `Telegram` group
<br>

I am building `LMODroid` right now
So, my code name is `lmodroid`
It could be `something else` according to your Selected rom
now, open `AndroidProducts.mk` using `nano` command

```bash
nano AndroidProducts.mk
```

Where you can see `blaze`, change it to `lmodroid`
Now, to save the `AndroidProducts.mk` press

`ctrl+o`

`enter`

`ctrl+x`


After pressing `ctrl+x` it will revert back to your current path.
Now, it's time to `rename & modify` the second file named `blaze_spes.mk`
For this particular rom, my codename is `lmodroid`

<b>Now, type this to rename</b>

```bash
mv blaze_spes.mk lmodroid_spes.mk
```

<b>Type</b>

```bash
ls
```

<b>To open `lmodroid_spes.mk` type</b>

```bash
nano lmodroid_spes.mk
```
Change these `2` things:
1. Inherit some common LineageOS stuff.
$(call inherit-product, vendor/`blaze`/config/common_full_phone.mk)
2. Product Specifics
PRODUCT_NAME := `blaze_spes`
It could be something else according to your device tree

<b>Change 1: replace `blaze` with lmodroid
<br>

Change 2: replace `blaze_spes` to `lmodroid_spes`</b>

I mean, in this two subsection `replace` the word `blaze` with `lmodroid`
Now, do the same procedure to save and exit as you did to save the `AndroidProducts.mk`

## Add Maintainer Tag ##

If your rom support this option, Then you can use either `FLAGS or OVERLAYS to set MAINTAINER NAME & BUILD TYPE` either it's `OFFICIAL` or `UNOFFICIAL` by specifying variables, enabling easy customization without changing core code. 

In the context of Android custom ROMs, flags and overlays are two methods used to modify the appearance and functionality of the ROM. Flags are typically used to enable or disable specific features, while overlays are used to replace or modify existing UI elements. 

The `MAINTAINER NAME && BUILD TYPE` is a piece of information that is often displayed on the about section in the ROM's settings menu. It is typically used to identify `BUILD TYPE` either it's `OFFICIAL` or `UNOFFICIAL` and the person or team who is responsible for `MAINTAINING` the ROM. 

To add <b>MAINTAINER NAME && BUILD TYPE</b> it may vary on the rom to rom.

<b>For e.g.:</b> 
1. `ProjectBlaze` use `flag` on the other hand
2. `EvolutionX` use `overlay`

<b>Default Path:</b>

1.<b>ProjectBlaze</b>: `device/xiaomi/spes/blaze_spes.mk`
2.<b>EvolutionX</b>: `device/xiaomi/spes/overlay/packages/apps/Settings/res/values/evolution_strings.xml`

<b>Live Path Example - Direct Link:</b>
1. [ProjectBlaze](https://github.com/tanvirr007/device_xiaomi_spes/blob/13/blaze_spes.mk#L27-L29)
2. [Evolution X](https://github.com/Evolution-X-Devices/device_xiaomi_spes/blob/tiramisu/overlay/packages/apps/Settings/res/values/evolution_strings.xml#L7-L12)

Most of the rom follow this method. Actually it's depends on the rom source and device tree. Some exceptional are:

i. [EvolutionX](https://github.com/etylix/device_xiaomi_spes/blob/snow/overlay-evolution/packages/apps/Settings/res/values/strings.xml#L7-L9) by [@etylix](https://github.com/etylix)

ii. [EvolutionX](https://github.com/TheMatheusDev/device_xiaomi_spes/blob/thirteen/overlay/SpesSettingsOverlay/res/values/evolution_strings.xml#L7-L9) by [@ascending](https://github.com/TheMatheusDev)




Use `nano` command to edit the `blaze_spes.mk` && `evolution_strings.xml` files

<b>For e.g.:</b> 

1. <b>ProjectBlaze:</b> 

```bash
nano blaze_spes.mk
```

2. <b>EvolutionX:</b> 

```bash
nano evolution_strings.xml
```

Now, do the same procedure to save and exit as you did to save the `AndroidProducts.mk` && `lmodroid_spes.mk`

That's it!!!


## Locate Rom Path ##

Now manually type ` cd .. ` to go on your rom directory, or paste this command below 👇

```bash
cd .. && cd .. && cd .. && ls
```

<b>`or this`</b>

```bash
cd ../../../ && ls
```

<b>`or this`</b>

```bash
cd .. && cd .. && cd ..
```

```bash
ls
```

That's it. Now, follow `next` step to start build the rom.
<br> <br>

## Final Step to Build Rom ##

The `vendor` & `kernel` will be started to clone in your device After paste this command 👇

```bash
. build/envsetup.sh
```
## Gapps & Vanilla ##

If you want `gapps` build paste this;
If you want `vanilla` build then `skip` this step & directly paste one of these `lunch` commands

```bash
exportWITH_GAPPS=true
```

## Lunch Commands ##

```bash
lunch lmodroid_spes-user
```

```bash
lunch lmodroid_spes-userdebug
```

```bash
lunch lmodroid_spes-eng
```

`Important Notes:` <br>

`user:` User builds are the final product that is released to the public. They are optimized for performance and security, and most debugging features are disabled.

`userdebug:` This build is similar to the user build, but it has some additional features enabled that are useful for debugging and beta testing. For example, the userdebug build allows you to connect a debugger to any process, and it enables more detailed logging.

`eng (engineering):` This build is designed for engineers who are developing and testing the ROM. It has all of the features of the userdebug build, plus some additional features that are useful for development, such as root access. But it's not optimized for performance or security. Not recommended for regular users.

## Start Compilation ##

```bash
mka bacon -j$(nproc --all)
```

<b>Caution:</b> If you have encountered this error:

`device/xiaomi/spes/parts/Android.bp:7:1: "XiaomiParts" depends on undefined module "org.lineageos.settings.resources"`

This conflict may vary on ROMS. Paste these two commands one by one to nuke this conflict.

First paste this👇

```bash
rm -fr packages/resources/devicesettings
```

Then Paste 👇

```bash
https://github.com/LineageOS/android_packages_resources_devicesettings
```







The first `command` is recommended, but if it's not effective for you, you can try one of these commands below: 👇

```bash
mka bacon
```

```bash
brunch [device codename]
```

```bash
make bacon
```

```bash
mka bacon -j`X`
```

```bash
make bacon -j$(nproc --all)
```

```bash
m [bring up codename] -j"$(nproc --all)"
```

***If you replace the `X` with the number of CPU cores your system has, the command will utilize all the cores available for compiling the ROM. For example, I have a 16-core CPU, so the command would look like this:👇


```bash

mka bacon -j16

```

Done, Now `wait` patiently.


***To remove the entire build directory/start `clean build` use the command `clobber`

```bash
make clobber
```

It removes previously compiled files, intermediate build artifacts, and configuration files from the build environment. This helps ensure a fresh and clean state before starting a new build process, preventing potential issues that might arise from previous build remnants. After using `make clobber` you'd then run the actual build command to create the ROM from a clean state.

<b> For e.g.:</b>

```bash
. build/envsetup.sh
```

```bash
export WITH_GAPPS=true
```

```bash
lunch lmodroid_spes-user
```

```bash
mka bacon -j$(nproc --all)
```


## Transfer ROM by SFTP ##

SFTP stands for `Secure File Transfer Protocol`. It's a secure method used to transfer files between computers over a network. SFTP is an extension of the `SSH (Secure Shell)` protocol, providing encryption and authentication to ensure secure data transfer. It's commonly used for securely transferring files, managing remote file systems, and performing file operations securely over a network.

`SourceForge` allows user to transfer files via SFTP method, So, I'm going to use SourceForge's `SFTP` protocol to move a file from my `Ubuntu` server to my `SourceForge` account</b>

Now, follow these steps below:

```bash
sftp tanvirr007@frs.sourceforge.net
```
After that it it prompt you to enter your password. Enter your password and press enter

```bash
cd /home/frs/project/[`your root account name`]/[`target path name`]
```
Suppose, My root name is `customromspes` and my targeted path is `LMODroid` It'll transfer the rom file into `LMODroid`. For that i have to paste this command

```bash
cd /home/frs/project/customromspes/LMODroid
```

After performing this command it'll take you to `LMODroid` directory. Now paste this command to start transferring the rom from `Ubuntu` to your `SourceForge` account

```bash
put [`file name`]
```

<b>For E.g:</b>
```bash
put AfterLife-V4.0-Wrath-UNOFFICIAL-spes-20231207-Gapps.zip
```
To verify the upload, you can use the `ls` command to list the files in the current directory

```bash
ls
```

Once you're done, type `bye` to exit the SFTP session

```bash
bye
```

That's all.


# Author #


This guide is based on the work of <strong>Tanvir Hasan (tanvirr007)</strong>. Please give proper credit to the author of this guide, [@tanvirr007](https://github.com/tanvirr007) , when using it in your own Rom.

<br> **`Contact:`**
- [Email](mailto:tanvirhasan2005@proton.me)
- [Telegram](https://t.me/tanvirr007)
