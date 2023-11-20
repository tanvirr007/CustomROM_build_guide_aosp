#!/bin/bash
echo "-------------------------------------------------------------"
echo "-          You will be prompted to enter password           -"
echo "-------------------------------------------------------------"
git clone https://github.com/tanvirr007/setup_scripts --depth 1 
pwd 
cd setup_scripts
echo "This will install basic tools required for building"
echo "Executing android_build_env.sh"
./android_build_env.sh
echo "Script executed succesfully"
echo "Now Executing deb-setup.sh"
./deb-setup.sh
echo "Script executed succesfully"
echo "Do you want to use swap? (y/n)"
read answer

if [ "$answer" = "y" ] || [ "$answer" = "yes" ]; then
    echo "Enabling swap..."
    chmod +x makeswap
    ./makeswap
  else
    echo "Not using swap."
fi
echo "Script by @iamharshit188"
echo "Thanks to tanvirr007 [Tanvir] for merging"

