# installation docker on ubuntu-server

## step 1: install docker

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

# verify the installation

```
sudo docker run hello-world
```


# TODO
set shellinbox for server
