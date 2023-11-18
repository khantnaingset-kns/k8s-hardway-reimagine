#!/bin/sh

cd ~

# Download and Install go

echo $'\e[32; Instaling go and cfssl tools'

sleep 2

curl -OL https://golang.org/dl/go1.21.4.linux-amd64.tar.gz

sha256sum go1.21.4.linux-amd64.tar.gz

sudo tar -C /usr/local -xvf go1.21.4.linux-amd64.tar.gz

echo 'export PATH=$PATH:/usr/local/go/bin' > ~/.profile

. ~/.profile

# Clean up

rm go1.21.4.linux-amd64.tar.gz

# Install cfssl

sudo go install github.com/cloudflare/cfssl/cmd/cfssl@latest

# Install cfssljson

sudo go install github.com/cloudflare/cfssl/cmd/cfssljson@latest

# Install kubectl

echo $'\e[32; Installing kubectl'

sleep 2

sudo apt update

sudo apt install  -y apt-transport-https ca-certificates curl gpg

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt update 

sudo apt install -y kubectl