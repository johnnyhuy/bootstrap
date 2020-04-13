#!/bin/bash

reset='\033[0m' 
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'

echo -e "${green}😎 Welcome to John's bootstrap script${reset}"

if [[ $EUID -eq 0 ]]
then
   echo -e "${red}Installation failed! Script must not be run as root 😡${reset}" 
   exit 1
fi

# Install git
if [ ! -f /usr/bin/git ]
then
    echo -e "${green}🌞 Installing Git${reset}"
    sudo apt-get update
    sudo apt-get install git -y
    echo -e '${blue}Done 😎${reset}'
fi

echo -e "${green}Setting Git credentials to cache"
git config --global credential.helper store
echo -e "${blue}Done 😎${reset}"

# Install the setup repo
setup_folder=/home/$USER/.johnnyhuy-setup
echo -e "${green}🌞 Installing setup repo to $setup_folder ${reset}"
if [ ! -d $setup_folder ]
then
    git clone 'https://github.com/johnnyhuy/setup.git' $setup_folder
else
    echo -e "${yellow}Repo already exists, doing a Git pull 😘${reset}"
    cd $setup_folder
    git pull
    cd - > /dev/null
fi
echo -e "${blue}Done 😎${reset}"

echo -e "${green}😎 Kicking off setup script ${reset}"
$setup_folder/linux.sh
