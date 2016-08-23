ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no kearl@eve-kearl.eastus.cloudapp.azure.com /bin/bash << EOF
    echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" | sudo tee -a /etc/apt/sources.list.d/docker.list;
    sudo apt-get update;
    sudo apt-get install docker-engine -y --force-yes;
    sudo docker run -d -p 80:4567 stujfiter/sparky;
EOF
