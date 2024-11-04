#!/bin/bash

 ## deploy a nodejs app and error handling
update_packages(){
    sudo apt-get update -y
}
code_clone(){
    echo "cloning the nodejs app"
    git clone https://github.com/suryanshvermaa/nodeJsBackendApp.git
}

install_requirements(){
    echo "Installing dependencies"
    sudo apt-get install docker.io nginx docker-compose -y
}
required_restarts(){
    sudo chown $USER /var/run/docker.sock
    sudo systemctl enable docker
    sudo systemctl enable nginx
    sudo systemctl restart docker
}
deploy(){
    docker build -t nodeJsBackendApp
    docker-compose up -d
}
echo "****** DEPLOYMENT STARTED *******"

update_packages
code_clone
cd nodeJsBackendApp
if ! install_requirements; then
    echo "Installation failed"
    exit 1
fi
if ! required_restarts; then
    echo "System fault identified"
fi
if ! deploy;then
    echo "Deployment failed, mailing the admin"
    #mailing
    exit 1
fi

echo "****** DEPLOYMENT DONE ******"