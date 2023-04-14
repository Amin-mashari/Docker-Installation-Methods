#! /bin/bash

str=$(docker compose version)
substr="Docker Compose version"

main () {
    if [[ $str == "$substr"* ]];
    then
        echo -e "You have docker-compose installed on your system\n$str\n"
        confirm
    else
        installLastRelease
    fi
}

confirm () {
    # call with a prompt string or use a default
    read -r -p "${1:-Do you want to install another version of docker-compose? [N/y]} " res
    case "$res" in
        [yY][eE][sS]|[yY]) 
            echo "yes"
            ;;
        *)
            exit 0
            ;;
    esac
}

installLastRelease () {
    url=$(curl -s https://api.github.com/repos/docker/compose/releases | grep "docker-compose-linux-x86_64" | cut -d : -f 2,3 | tr -d \" | grep -v "," | grep -v ".sha256" | head -n 1)
    mkdir ./tmp-docker-compose
    curl -SL $url -o ./tmp-docker-compose/docker-compose

    sudo chmod +x ./tmp-docker-compose/docker-compose
    sudo mv ./tmp-docker-compose/docker-compose /usr/local/bin
    rm -rf ./tmp-docker-compose/

    docker compose version
}

# curl -s https://api.github.com/repos/docker/compose/releases | grep "docker-compose-linux-x86_64" | cut -d : -f 2,3 | tr -d \" | grep -v "," | grep -v ".sha256" | head -n 1

main