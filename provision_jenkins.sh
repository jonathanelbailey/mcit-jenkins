#! /bin/bash

wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
echo "deb https://pkg.jenkins.io/debian binary/" >> /etc/apt/sources.list

apt-get update
apt-get install python-pip -y
pip install ansible
echo "localhost ansible_connection=local" >> /etc/ansible/hosts
ansible-galaxy install geerlingguy.jenkins

ansible-playbook -i "localhost," -c local /vagrant/jenkins_config.yml
echo "jenkins   ALL=(ALL)   NOPASSWD:ALL" >> /etc/sudoers