#!/bin/sh

# APT update
update_apt() {
    sudo apt update
}


cd ~

# Download and Install go
echo '---------------------------------------------------'
echo '---------- Installing go and cfssl tools ----------'
echo '---------------------------------------------------'
echo \n

sleep 2

curl -OL https://golang.org/dl/go1.21.4.linux-amd64.tar.gz

sha256sum go1.21.4.linux-amd64.tar.gz

sudo tar -C /usr/local -xvf go1.21.4.linux-amd64.tar.gz

echo 'export PATH=$PATH:/usr/local/go/bin' > ~/.profile

. ~/.profile

# Clean up

rm go1.21.4.linux-amd64.tar.gz

# Install cfssl

go install github.com/cloudflare/cfssl/cmd/cfssl@latest

# Install cfssljson

go install github.com/cloudflare/cfssl/cmd/cfssljson@latest

# Install required packages

update_apt

sudo apt install  -y apt-transport-https ca-certificates curl gnupg

# Install kubectl
echo '---------------------------------------------------'
echo '--------- Installing kubectl ----------'
echo '---------------------------------------------------'
echo \n

sleep 2

update_apt

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg -y

echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

update_apt

sudo apt install -y kubectl

# Install gcloud

update_apt

echo "deb [signed-by=/usr/share/keyrings/cloud.google.asc] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

echo "deb https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.asc

update_apt

sudo apt install google-cloud-cli