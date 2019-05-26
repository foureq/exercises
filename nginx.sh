#!/bin/bash
yum -y install gcc openssl-devel pcre-devel
tar -xf /opt/nginx-1.8.0.tar.gz
cd nginx-1.8.0
./configure
make
make install
