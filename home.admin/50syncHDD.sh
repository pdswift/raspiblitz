#!/bin/bash

## get basic info
source /home/admin/raspiblitz.info 2>/dev/null

# only show warning when bitcoin
if [ "$network" = "bitcoin" ]; then
  msg=""
  msg="$msg Syncing is just practical for Bitcoin TESTNET!\n"  
  msg="$msg TESTNET is OK for learning, testing and development.\n"
  msg="$msg MAINNET is where things get real and fun.\n"
  msg="$msg \n"
  msg="$msg Syncing MAINNET on a raspberry is NOT practical.\n"
  msg="$msg If you want MAINET, go back & try DOWNLOAD.\n"
  msg="$msg \n" 
  msg="$msg Do you really want to work with ONLY TESTNET?"
  
  dialog --title " WARNING " --yesno "${msg}" 12 57
  response=$?
  case $response in
     0) echo "--> OK";;
     1) ./10setupBlitz.sh; exit 1;;
     255) ./10setupBlitz.sh; exit 1;;
  esac
fi  

echo "*** Activating Blockain Sync ***"
sudo mkdir /mnt/hdd/${network}
echo "OK - sync is activated"

# set SetupState
sudo sed -i "s/^setupStep=.*/setupStep=50/g" /home/admin/raspiblitz.info

# continue setup
./60finishHDD.sh
