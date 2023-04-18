#! /bin/bash

# First, switch to the root user

# main function, start script from here
main () {
    if [ $# -eq 1 ] && [ $1 == '-h' ];
    then
        help
    elif [ $# -eq 0 ];
    then
        getInput
    else
        err
    fi
}

# Error function for input parameter error
err () {
    echo -e "\ninput parameter error!\nused bellow input parameter\n"
    help
    exit 1
}

# This function for install and enable resolvconf service
installResolvconf () {
    serviceName="resolvconf.service"
    DEB_PACKAGE_NAME="resolvconf"

    # update system
    apt-get update 2>> /dev/null

    # install package
    apt-get install $DEB_PACKAGE_NAME 2>> /dev/null

    # enable and start and check is active resolvconf.service
    systemctl enable $serviceName
    systemctl start $serviceName
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

# Help function
help () {
    echo -e "\n\t------------------HELP---------------------"
    echo -e "\tAfter you run this script you must choose 1 or 2\n
    \t1: for install and run resolvconf service.
    \t2: for set dns ips\n
    \tIn section 2, You must enter your desired dns IPs in the following format:
    \t178.22.122.100,185.51.200.2
    \tYou must to separate the IPs with a (,) symbol"

}

# Start script from here
main $@