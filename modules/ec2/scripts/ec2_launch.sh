#!/bin/bash
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd

echo "<html><h1> Hi Sumathi, This is webserver from EC2" > /var/www/html/index.html
