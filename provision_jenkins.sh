#! /bin/bash

wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
echo "deb https://pkg.jenkins.io/debian binary/" >> /etc/apt/sources.list

apt-get update
apt-get install ansible -y
echo "127.0.0.1" >> /etc/ansible/hosts
ansible-galaxy install geerlingguy.jenkins
