# mcit-jenkins
a vagrant box that brings up a portable jenkins server.  The server itself is configured through ansible.

## Contents
- mcit-jenkins-build/Dockerfile *DEPRECATED*
- mcit-jenkins-data-build/Dockerfile *DEPRECATED*
- roles/git/tasks/main.yml
- docker-compose.yml *DEPRECATED*
- Vagrantfile
- jenkins_config.yml
- LICENSE
- README.md
- provision_jenkins.sh
- provision_docker.sh *DEPRECATED*

## Dependencies
- ansible 2.0+
- bento/ubuntu-16.04
- jenkins 2.6+

## Requisites
- vagrant
- virtualbox

## Usage

To run this, type `vagrant up`
