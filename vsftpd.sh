#!/bin/bash
yum -y install vsftpd
systemctl restart vsftpd
systemctl enable vsftpd

