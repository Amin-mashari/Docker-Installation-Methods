#! /bin/bash

# URL is global variable
URL="url"


str=$(docker compose version)
substr="Docker Compose version"

# Start script from this function
main() {
    check
}

# Checks whether docker-compose is installed or not?
check() {
    if [[ $str == "$substr"* ]];
    then
        echo -e "You have docker-compose installed on your system\n$str\n"
        confirm
    else
        installLastRelease
    fi
}

# If docker-compose is installed in the system, 
# it asks the user if he wants to install another version of it?
confirm() {
    # call with a prompt string or use a default
    read -r -p "${1:-Do you want to install another version of docker-compose? [N/y]} " res
    case "$res" in
        [yY][eE][sS]|[yY]) 
            installWithVersion
            ;;
        *)
            exit 0
            ;;
    esac
}

# Install docker-compose With a specific version
installWithVersion() {
    # remove last version of docker-compose
    sudo rm -rf $(which docker-compose)

    echo -e "Installable versions\nPlease waite..."
    curl -s https://api.github.com/repos/docker/compose/releases | grep "tag_name" | cut -d ":" -f 2 | tr -d \"\, | tr "\n" " " && echo
    echo -e "\n"
    read -r -p "Enter one of the above versions: " tag_name

    URL="https://github.com/docker/compose/releases/download/$tag_name/docker-compose-linux-x86_64"
    
    installDockerCompose
}

# Install last version of docker-compose
installLastRelease() {
    URL=$(curl -s https://api.github.com/repos/docker/compose/releases | grep "docker-compose-linux-x86_64" | cut -d : -f 2,3 | tr -d \" | grep -v "," | grep -v ".sha256" | head -n 1)
    
    installDockerCompose    
}

# Install docker-compose with a specific URL
installDockerCompose() {
    mkdir ./tmp-docker-compose
    curl -SL $URL -o ./tmp-docker-compose/docker-compose

    sudo chmod +x ./tmp-docker-compose/docker-compose
    sudo mv ./tmp-docker-compose/docker-compose /usr/local/bin
    rm -rf ./tmp-docker-compose/

    docker compose version
}

# Start script from here
main