#!/bin/bash
sudo su
yum update -y
yum install python-pip -y
pip install ansible
pip install boto3
yum install java-1.8.0-openjdk-devel.x86_64 -y
yum update -y
yum install gcc -y
yum install git -y
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
yum install jenkins -y
service jenkins start
chkconfig jenkins on
