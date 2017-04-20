FROM jenkinsci/blueocean:1.0.1
MAINTAINER Jonathan Bailey

USER root
RUN mkdir -p /var/log/jenkins
RUN mkdir /var/cache/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins
RUN chown -R jenkins:jenkins /var/cache/jenkins
USER jenkins

ENV JENKINS_OPTS="--logfile=/var/log/jenkins/jenkins.log --webroot=/var/cache/jenkins/war"

VOLUME ["/var/log/jenkins", "/var/jenkins_home"]
