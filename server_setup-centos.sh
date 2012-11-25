#!/bin/bash

yum -y upgrade

wget http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-7.noarch.rpm
wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
rpm -Uvh remi-release-6*.rpm epel-release-6*.rpm

yum -y groupinstall 'Development Tools'
yum -y install httpd mod_ssl byobu bzip2 curl dmidecode ethtool fail2ban git hdparm iproute logrotate logwatch lynx mlocate mtr mysql-server ntp php php-gd php-mysql pwgen subversion git sysstat shorewall unzip system-config-firewall-tui

password=$(pwgen 18 1)
useradd -m -G wheel,adm -p $password alex

sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/sshd_config

