#!/bin/bash

#run on old server

newserver=host2
databases="wordpress wp_testsite"

for d in $databases; do
    ARCHIVE=$d.sql.gz
    mysqldump --opt $d |gzip -c9 > /root/$ARCHIVE
    scp /root/$ARCHIVE $newserver:/root/
    #ssh $newserver "mysql -e \"create database $d\""
    ssh $newserver "zcat /root/$ARCHIVE | mysql $d"
done

rsync -avz /srv/www $newserver:/srv/

