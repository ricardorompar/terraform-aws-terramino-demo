#!/bin/bash

curl -OL https://go.dev/dl/go1.23.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xvf go1.23.1.linux-amd64.tar.gz

export PATH=$PATH:/usr/local/go/bin
export HOME="/tmp/home"
export GOPATH="/tmp/go"
export GOMODPATH="/tmp/go/pkg/mod"
export GOCACHE="/tmp/go/cache"

cd /tmp
git clone https://github.com/hashicorp-education/terramino-go.git
cd terramino-go

APP_NAME=${app_name} TERRAMINO_PORT=${port} go run main.go