#! /bin/bash

echo "updating packages..."
apt-get update -y
echo "adding packages..."
apt-get install nfs-common linux-image-extra-$(uname -r) \
linux-image-extra-virtual apt-transport-https ca-certificates curl \
software-properties-common -y
mkdir /jenkins_home
echo "creating NFS mounts..."
mount -t nfs nfs1.magiccityit.com:/data-volume/remote/docker_volumes/mcit-jenkins-data /jenkins_home
echo "installing docker repo dependencies..."
echo "Installing Docker GPG key: $(curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -)"
add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"
apt-get update -y
echo "installing docker..."
apt-get install docker-ce -y
echo "installing docker-compose..."
curl -L https://github.com/docker/compose/releases/download/1.12.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
cd /vagrant
echo "adding vagrant box to host file"
ip=$(ip a | grep enp | grep inet | awk '{print $2 }')
echo "$(hostname) ${ip::-3}" >> /etc/hosts
echo "building docker containers"
docker-compose up -d
echo "admin password is $(docker exec vagrant_mcitjenkins_1 cat /var/jenkins_home/secrets/initialAdminPassword)"