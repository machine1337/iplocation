#!/bin/bash
NC='\033[0m'
RED='\033[1;38;5;196m'
GREEN='\033[1;38;5;040m'
ORANGE='\033[1;38;5;202m'
BLUE='\033[1;38;5;012m'
BLUE2='\033[1;38;5;032m'
PINK='\033[1;38;5;013m'
GRAY='\033[1;38;5;004m'
NEW='\033[1;38;5;154m'
YELLOW='\033[1;38;5;214m'
CG='\033[1;38;5;087m'
CP='\033[1;38;5;221m'
CPO='\033[1;38;5;205m'
CN='\033[1;38;5;247m'
CNC='\033[1;38;5;051m'

function banner(){
echo -e ${RED}"##################################################################"                                                    
echo -e ${CP}"     _____ ____       _                   _____ _           __    #"
echo -e ${CP}"    / /_ _|  _ \     | |    ___   ___ __ |_   _(_) ___  _ __\ \   #"                                             
echo -e ${CP}"   | | | || |_) |____| |   / _ \ / __/ _  || | | |/ _ \|  _ \| |  #"        
echo -e ${CP}"  < <  | ||  __/_____| |__| (_) | (_| (_| || | | | (_) | | | |> > #"        
echo -e ${CP}"   | ||___|_|        |_____\___/ \___\__ _||_| |_|\___/|_| |_| |  #"        
echo -e ${CP}"    \_\                                                     /_/   #"                                                 
echo -e ${BLUE}"         An Efficent Script To Find The GeoLocation Of IP         #"
echo -e ${YELLOW}"                   Coded By: Machine404                           #"
echo -e ${CNC}"                   https://github.com/machine1337                 #"
echo -e ${GREEN}"                   https://facebook.com/unknownclay               #"
echo -e ${RED}"##################################################################"
}
function requiredstuff(){
echo "Checking dependencies configuration " 
sleep 1
if [[ "$(ping -c 1 8.8.8.8 | grep '100% packet loss' )" != "" ]]; then
  echo ${RED}"No Internet Connection"
  exit 1
  else
  echo -e ${GREEN} "\n[ ✔ ] Internet.............${GREEN}[ working ]"
fi
sleep 1
which jq > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e ${GREEN} "\n[ ✔ ] jq.............${GREEN}[ found ]"
else
echo -e $red "[ X ] jq  -> ${RED}not found "
echo -e ${YELLOW} "[ ! ] Installing jq "
sudo apt-get install jq
echo -e ${BLUE} "[ ✔ ] Done installing ...."
fi
sleep 1
which curl > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e ${GREEN} "\n[ ✔ ] curl.............${GREEN}[ found ]"
else
echo -e $red "[ X ] curl  -> ${RED}not found "
echo -e ${YELLOW} "[ ! ] Installing curl "
sudo apt-get install curl
echo -e ${BLUE} "[ ✔ ] Done installing ...."
fi
sleep 1
}
function exposeip(){
echo -e -n ${CP}"\n[*] Enter Target IP: "
read ip
dest="http://ip-api.com/json/"
echo -e -n ${RED}"\n[ ✔ ] [VICTIM IP]: $ip \n"

temp=$(curl -s $dest$ip | jq  -r '.country')
echo -e -n ${NEW}"\n[ ✔ ] [COUNTRY]:  $temp \n"
temp=$(curl -s $dest$ip | jq  -r '.regionName')
echo -e -n ${ORANGE}"\n[ ✔ ] [REGION-NAME]:  $temp \n"
temp=$(curl -s $dest$ip | jq  -r '.city')
echo -e -n ${PINK}"\n[ ✔ ] [CITY]:  $temp \n"
temp=$(curl -s $dest$ip | jq  -r '.lat')
echo -e -n ${YELLOW}"\n[ ✔ ] [LATITUTE]:  $temp \n"
temp=$(curl -s $dest$ip | jq  -r '.lon')
echo -e -n  ${BLUE}"\n[ ✔ ] [LONGITUTDE]:  $temp \n"
temp=$(curl -s $dest$ip | jq  -r '.isp')
echo -e -n ${CG}"\n[ ✔ ] [ISP]:  $temp \n"
temp=$(curl -s $dest$ip | jq  -r '.as')
echo -e -n ${CN}"\n[ ✔ ] [AS]:  $temp \n"
temp=$(curl -s $dest$ip | jq  -r '.timezone')
echo -e -n ${CP}"\n[ ✔ ] [TIMEZONE]:  $temp \n"
temp=$(curl -s $dest$ip | jq  -r '.zip')
echo -e -n ${YELLOW}"\n[ ✔ ] [ZIPCODE]:  $temp \n"
sleep 1
echo -e -n ${RED}"\n<--------Thanks For Using IP-Location Script--------->\n"


}
clear
requiredstuff
clear
banner
exposeip
