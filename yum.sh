#!/bin/bash
echo '[autoyum]
name = autoyum
baseurl = http://content.example.com/rhel7.0/x86_64/dvd
enabled = 1
gpgcheck = 0' > /etc/yum.repos.d/autoyum.repo
