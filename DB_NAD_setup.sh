#!/bin/bash

main(){
clear
echo -e 'Choose MAC clone mode \n1.Gad Bsns \n2.Dshn \n3.Random'
read mainst
if [[ "${mainst}" == 1 ]]
then
	4bsns
elif  [[ "${mainst}" == 2 ]]
then
	4dashen
elif [[ "${mainst}"  == 3 ]]
then
	rndm
else
	echo 'Idiot! Am done with you. Bye!'
	exit
fi
}
4bsns(){
clear
echo "Setting up macaddress..."
sudo networkctl down wlp2s0
sudo macchanger -m 74:8a:28:53:bb:52 wlp2s0
sudo networkctl up wlp2s0
echo 'Current Address: '
ifconfig wlp2s0 |grep 'ether'
echo "MAC cloned!"
read -p 'Ready to connect to Business network...press any key to revert. \nDon`t close this...'
echo "Reverting address"
sudo networkctl down wlp2s0
sudo macchanger -m 80:7b:1e:12:18:c4  wlp2s0
sudo networkctl up wlp2s0
echo 'Current Address: '
ifconfig wlp2s0 |grep 'ether'
echo 'Reverted Successfuly!!'
}
4dashen(){
clear
echo "Setting up macaddress..."
sudo networkctl down wlp2s0
sudo macchanger -m 10:98:c3:a7:cf:db wlp2s0
sudo networkctl up wlp2s0
echo 'Current Address: '
ifconfig wlp2s0 |grep 'ether'
echo "MAC cloned!"
read -p 'Ready to connect to network...press any key to revert. \nDont close this...'
echo "Reverting address"
sudo networkctl down wlp2s0
sudo macchanger -m 80:7b:1e:12:18:c4  wlp2s0
sudo networkctl up wlp2s0
echo 'Current Address: '
ifconfig wlp2s0 |grep 'ether'
echo 'Reverted Successfuly!!'
}
rndm(){
clear
echo "Setting up macaddress..."
sudo networkctl down wlp2s0
sudo macchanger -r wlp2s0
sudo networkctl up wlp2s0
echo 'Current Address: '
ifconfig wlp2s0 |grep 'ether'
echo "MAC cloned!"
read -p "Ready to connect to network...press any key to revert. \nDon't close this..."
echo "Reverting address"
sudo networkctl down wlp2s0
sudo macchanger -m 80:7b:1e:12:18:c4  wlp2s0
sudo networkctl up wlp2s0
echo 'Current Address: '
ifconfig wlp2s0 |grep 'ether'
echo 'Reverted Successfuly!!'
}
main
