#! /bin/bash

yum -y install ansible

echo "localhost ansible_connection=local" >> /etc/ansible/hosts

ansible-playbook -i "localhost," -c local /vagrant/main.yml