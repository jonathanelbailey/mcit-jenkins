#! /bin/bash

echo "updating packages..."
apt-get update -y
echo "installing ansible..."
apt-get install python-pip -y
pip install ansible
echo "localhost ansible_connection=local" >> /etc/ansible/hosts
ansible-playbook -i localhost -c local /vagrant/jenkins_config.yml
# mkdir /jenkins_home
# echo "installing docker repo dependencies..."
# echo "Installing Docker GPG key: $(curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -)"
# add-apt-repository \
# "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
# $(lsb_release -cs) \
# stable"
# apt-get update -y
# echo "installing docker..."
# apt-get install docker-ce -y
# echo "installing docker-compose..."
# curl -L https://github.com/docker/compose/releases/download/1.12.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
# chmod +x /usr/local/bin/docker-compose
# cd /vagrant
# echo "adding vagrant box to host file"
# ip=$(ip a | grep enp | grep inet | awk '{print $2 }')
# echo "$(hostname) ${ip::-3}" >> /etc/hosts
# echo "building docker containers"
# docker-compose up -d
# echo "admin password is $(docker exec vagrant_mcitjenkins_1 cat /var/jenkins_home/secrets/initialAdminPassword)"