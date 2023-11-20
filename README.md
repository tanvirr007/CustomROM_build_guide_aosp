# Custom Rom Build #
This is the Custom Rom build guide for Redmi Note 11 (spes/spesn)

```bash

#Requirements
1. A cloud server
2. Minimum 8-core & 32 GB RAM
3. Higher specs are better
4. 500 GB+ storage
5. Device: Redmi Note 11
6. Codename: spes/spesn
7. Stable internet connection
8. OS Ubuntu 20.04 LTS or latest
9. Working brain 

```

## Build Environment ##

OS: Ubuntu 18.04 and higher [Any operating system would do (Debian Recommended)]
Version: 64-bit

<b>Installing required packages</b>

```bash
sudo apt-get install git-core gnupg flex bison build-essential zip curl zlib1g-dev libc6-dev-i386 libncurses5 x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig
```
<br>

<b>Setting Up Build Environment</b>

## First clone the repo ##

```bash
git clone https://github.com/tanvirr007/CustomROM_build_guide_aosp
cd CustomROM_build_guide_aosp
sh setup.sh
```

## Directory Structure 
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

```bash
#Device tree contains

1. device_xiaomi_spes
2. vendor_xiaomi_spes
2. hardware_xiaomi_spes
3. kernel_xiaomi_spes

spes is my device codename
It varies phone to phone

```

i will use
device tree / vendor forked tree from jabiyeff21 and dblenk9
Mi680 kernel from AkiraNoSushi and muralivijay9845
## Credits ##

Thanks @jabiyeff21 for device tree

Thanks @dblenk9 for device tree

Thanks @sayann70] (bro) for base

Thanks @AkiraNoSushi for Mi680 kernel

Thanks @muralivijay9845 for Mi680 kernel

Thanks @JassiV07 for recovery

Thanks [@iamharshit188](https://github.com/iamharshit188)for base setup/env script



## Starting ##

<b>I am going to build LibreMobileOs (LMODroid)</b>

```bash
mkdir rom_name
```

```bash
cd rom_name
```
<br>

<b>Note:</b> Here, "rom_name" means, use the rom name that you're going to build or you can choose any kind names whatever the fuck you want

## Clone Rom Source ##

<b>Download/Clone</b> rom manifest from GitHub or GitLab into the <b>rom_name</b> folder

<b>Initialize local repository</b>
```bash
repo init -u https://git.libremobileos.com/LMODroid/manifest.git -b thirteen --git-lfs
```

<b>Sync</b>
```bash
repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all)
```
 
Here,
<b>-b stands for branch

thirteen stands for branch name
</b>
<br>
## Clone Device Tree ##

<b>Download/Clone</b> Device/Vendor/Hardware/Kernel tree from GitHub or GitLab into the <b>rom_name</b> folder. I'll use my Pre merged Device/Vendor/Hardware/Kernel Tree

```bash

git clone https://github.com/tanvirr007/device_xiaomi_spes -b 13 device/xiaomi/spes
```
<b>Here,</b>
-b stands for branch
13 for branch name
<b>device/xiaomi/spes</b> is the download path
<br>

<b>Now clone this</b> 👇

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
<br>
## Bring Up ##

Now, you must have to modify these <b>2</b> files on device tree named

<b>1. AndroidProducts.mk
2. blaze_spes.mk</b>

Each rom use different/same code names likes

<b>Pixel Experience use: aosp
LMODroid use: lmodroid
PixelOS use: aosp
Project Elixir use: aosp</b>
it's available either on their <b>GitHub</b> manifest pages or in <b>Telegram</b> group
<br>

I am building <b>LMODroid</b> right now
So, my code name is <b>lmodroid</b>
It could be <b>something else</b> according to your Selected rom
now, open <b>AndroidProducts.mk</b> using <b>nano</b> command

```bash
nano AndroidProducts.mk
```

Where you can see <b>blaze</b>, change it to <b>lmodroid</b>
Now, to save the <b>AndroidProducts.mk</b> press
<b>"ctrl+o"
"enter"
"ctrl+x"</b>
After pressing ctrl+x it will revert back to your current path.
Now, it's time to <b>rename & modify</b> the second file named <b>blaze_spes.mk</b>
For this particular rom, my <b>codename is lmodroid</b>
<b>Now, type this to rename</b>

```bash
mv blaze_spes.mk lmodroid_spes.mk
```

<b>Type</b>

```bash
ls
```

<b>To open "lmodroid_spes.mk", press</b>

```bash
nano lmodroid_spes.mk
```
Change these <b>2</b> things:
1. Inherit some common LineageOS stuff.
$(call inherit-product, vendor/<b>blaze</b>/config/common_full_phone.mk)
2. Product Specifics
PRODUCT_NAME := <b>blaze</b>_spes
It could be something <b>else</b> according to your device tree
<b>Change 1: replace "blaze" with lmodroid
<br>
Change 2: replace blaze_spes to lmodroid_spes</b>
I mean, in this two subsection <b>replace the word "blaze" with "lmodroid"</b>
Now, do the same procedure to save and exit as you did to save the <b>AndroidProducts.mk</b>
## Add Maintainer Tag ##

If your rom support this option, Then you can use either <b>FLAGS or OVERLAYS to set MAINTAINER NAME & BUILD TYPE</b> either it's <b>OFFICIAL</b> or <b>UNOFFICIAL</b> by specifying variables, enabling easy customization without changing core code. 

In the context of Android custom ROMs, flags and overlays are two methods used to modify the appearance and functionality of the ROM. Flags are typically used to enable or disable specific features, while overlays are used to replace or modify existing UI elements. 

The MAINTAINER NAME && BUILD TYPE is a piece of information that is often displayed on the about section in the ROM's settings menu. It is typically used to identify <b>BUILD TYPE</b> either it's <b>OFFICIAL</b> or <b>UNOFFICIAL</b> and the person or team who is responsible for <b>MAINTAINING</b> the ROM. 

To add <b>MAINTAINER NAME && BUILD TYPE</b> it may <b>vary</b> on the rom to rom.

<b>For e.g.:</b> 
1. <b>ProjectBlaze</b> use flag &&
2. <b>EvolutionX</b> use overlay
<b>Default Path:</b>
1.<b>ProjectBlaze</b>: device/xiaomi/spes/blaze_spes.mk
2.<b>EvolutionX</b>: device/xiaomi/spes/overlay/packages/apps/Settings/res/values/evolution_strings.xml

<b>Direct Link:</b>
1. [ProjectBlaze](https://github.com/tanvirr007/device_xiaomi_spes/blob/13/blaze_spes.mk#L27-L29)
2. [Evolution X](https://github.com/Evolution-X-Devices/device_xiaomi_spes/blob/tiramisu/overlay/packages/apps/Settings/res/values/evolution_strings.xml#L7-L12)
Use <b>nano</b> command to edit the .mk && .xml files
<b>For e.g.:</b> 
1. <b>ProjectBlaze:</b> nano blaze_spes.mk
2. <b>EvolutionX:</b> nano evolution_strings.xml

Now, do the same procedure to save and exit as you did to save the <b>AndroidProducts.mk</b> && <b>lmodroid_spes.mk</b>

That's it!!!
## Locate Rom Path ##

Now manually type ( cd .. ) to go on your rom directory, or paste this command below 👇

```bash
cd ../../../ && ls
```

That's it. Now, follow next step to start build the rom.
<br> <br>
## Final Step to Build Rom ##
The <b>vendor & kernel</b> will be started to clone in your device After paste this command 👇

```bash
. build/envsetup.sh
```
## Gapps & Vanilla ##
If you want <b>gapps</b> build paste this;
If you want <b>vanilla</b> build <b>skip</b> this step & directly paste one of these <b>lunch</b> commands

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

<b> Important Notes: </b> <br>
<b>user:</b> User builds are the final product that is released to the public. They are optimized for performance and security, and most debugging features are disabled.

<b>userdebug:</b> This build is similar to the user build, but it has some additional features enabled that are useful for debugging and beta testing. For example, the userdebug build allows you to connect a debugger to any process, and it enables more detailed logging.

<b>eng (engineering):</b> This build is designed for engineers who are developing and testing the ROM. It has all of the features of the userdebug build, plus some additional features that are useful for development, such as root access. But it's not optimized for performance or security. Not recommended for regular users.
## Start compilation ##

```bash
mka bacon -j$(nproc --all)
```

The first command is recommended, but if it's not effective for you, you can try one of these commands below: 👇

```bash
mka bacon
```

```bash
brunch spes
```

```bash
make bacon
```

```bash
mka bacon -j$(nproc --all)
```

***If you replace the (X) with the number of CPU cores your system has, the command will utilize all the cores available for compiling the ROM. For example, I have a 16-core CPU, so the command would look like this:👇


```bash

mka bacon -j16

```

Done, Now wait patiently.
# Author #


This guide is based on the work of <strong>Tanvir Hasan (tanvirr007)</strong>. Please give proper credit to the author of this guide, [@tanvirr007](https://github.com/tanvirr007) , when using it in your own Rom.

<br> **Contact:**
- [Email](mailto:tanvirhasan2005@proton.me)
- [Telegram](https://t.me/tanvirr007)
