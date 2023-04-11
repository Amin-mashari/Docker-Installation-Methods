# installation docker on ubuntu-server

## step 1: uninstall docker

first remove older versions

```
 sudo apt-get remove docker docker-engine docker.io containerd runc
```

## step 2: setup ubuntu repository

1.Update the apt package index and install packages to allow apt to use a repository over HTTPS:
```
sudo apt-get update

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg
```
2.Add Docker’s official GPG key:
```
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

3.Use the following command to set up the repository:
```
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```


## step 2.5: set dns for iranian people

```
sudo echo >> /etc/resolv.conf "nameserver 178.22.122.100"
sudo echo >> /etc/resolv.conf "nameserver 185.51.200.2"
```

## step 3:Install Docker Engine

1.Update the apt package index

```
sudo apt-get update
```

if Receiving a GPG error when running apt-get update..
then run code below

```
sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt-get update
```

2.Install Docker Engine, containerd, and Docker Compose.
```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

## step 4:set up a docker registery

1. add mirror registery to docker deamon
```
sudo echo >> /etc/docker/daemon.json '{"registry-mirrors": ["https://registry.docker.ir"]}'
```

2. restart engine
```
systemctl daemon-reload
systemctl restart docker
```

# verify the installation

```
sudo docker run hello-world
```

### to run docker without sudo
```
groupadd docker
usermod -aG docker $USER
newgrp docker
chown "$USER":"$USER" /home/"$USER"/.docker -R
chmod g+rwx "$HOME/.docker" -R
```
