#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title IP
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🖥
# @raycast.argument1 { "type": "text", "placeholder": "IP Address", "optional": true}
# @raycast.packageName IP Utils

# Documentation:
# @raycast.description Shows the information of IP address, if not specifed, shows your macOS's internal and internet IP.
# @raycast.author Archean Zhang 
# @raycast.authorURL https://archeanz.com

ip=$1
ipinfotoken='' # Fill your own api token from ipinfo.io.
ipinfoapi="https://ipinfo.io/$ip?token=$ipinfotoken"
# backup api: "http://ip-api.com/line/{query}"

function myip () {
    echo ""
    echo "Wireless: "`ipconfig getifaddr en0`
    echo "Ethernet: "`ipconfig getifaddr en1`
    wanip=`dig +short myip.opendns.com @208.67.222.222 @208.67.220.220`
    [ $wanip ] && echo "Internet: "$wanip && getipinfo
    echo $wanip | tr -d '\n' | pbcopy
    echo ""
}

function iplocation() {
    if [[ ! $ip =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
        ip=$(dig +short $ip | tail -n 1)
    fi
    echo ""
    echo "Querying IP: "$ip
    echo ""
    ipinfoapi="https://ipinfo.io/$ip?token=$ipinfotoken"
    getipinfo
}

function getipinfo() {
    curl -s $ipinfoapi 
}

function usage() {
    echo -e " "
    echo "  usage:"
    echo -e " "
    echo "ip shows Wireless, Ethernet, OpenVPN and Internet IP address"
    echo "ip [IP] shows the location of IP address"
    echo "ip [domain] shows the location of domain"
    echo -e " "
}

if [[ $ip ]]; then
    iplocation
else
    myip
fi
