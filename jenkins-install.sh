#!/bin/bash
#description :jenkins installation on centos
#author:hercelle
#date: 3/6/23
  
# install java
sudo yum install java-11-openjdk-devel -y

#enable the jenkins repository
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key

#instsll the latest stable version of jenkins
sudo yum install jenkins -y
sudo systemctl start jenkins
sudo systemctl status jenkins
sudo systemctl enable jenkins

# adjut the firewall
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
sudo firewall-cmd --reload
echo "installation are successful"

