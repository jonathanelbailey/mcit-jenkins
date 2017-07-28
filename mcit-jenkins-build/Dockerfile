FROM jenkins/jenkins:lts
MAINTAINER Jonathan Bailey

USER root

RUN apt-get clean && apt-get update && apt install sudo python3 -y

RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
RUN mkdir -p /var/log/jenkins
RUN mkdir /var/cache/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins
RUN chown -R jenkins:jenkins /var/cache/jenkins
RUN install-plugins.sh github mask-passwords jobConfigHistory blueocean ssh
USER jenkins

ENV JENKINS_OPTS="--logfile=/var/log/jenkins/jenkins.log --webroot=/var/cache/jenkins/war"

VOLUME ["/var/log/jenkins", "/var/jenkins_home"]

USER root