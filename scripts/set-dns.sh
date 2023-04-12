#! /bin/bash

# First, switch to the root user

# This function for install and enable resolvconf service
installResolvconf () {
    PACKAGE="resolvconf"
    DEB_PACKAGE_NAME="resolvconf.service"

    # update system
    apt-get update 2>> /dev/null

    # install package
    apt-get install $DEB_PACKAGE_NAME 2>> /dev/null

    # enable and start and check is active resolvconf.service
    systemctl enable resolvconf.service
    systemctl start resolvconf.service
    echo -e "\nresolved service is $(systemctl is-active resolvconf.service)\n"
}

# This function for get and set ips dns on your system
setDnsIp () {
    # read string input
    read -p "Enter dns ip and Separate IPs with commas (dns-ip1,dns-ip2,...): " ips

    # Set comma as delimiter
    IFS=','

    # Read the split words intp on array based on comma delimiter.
    read -a strarr <<< "$ips"

    for (( n=0; n < ${#strarr[*]}; n++ ))
    do
        echo -e "nameserver ${strarr[n]}" >> /etc/resolvconf/resolv.conf.d/head
    done
    resolvconf --enable-updates
    resolvconf -u
}

getInput () {
    echo -e "1. install and run resolvconf service.\n2. get dns ips"
    read -p "1/2: " cin

    if [ $cin -eq '1' ]; then
        installResolvconf
    elif [ $cin -eq '2' ]; then
        setDnsIp
    else
        echo -e "\n\tinput invalid."
    fi
}

help () {
    #TODO
}

# Start script from here
getInput