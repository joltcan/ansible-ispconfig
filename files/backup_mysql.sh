#!/bin/bash

umask 0077

# backup the database
/usr/bin/mysqldump --all-databases | nice -19 pbzip2 > mysqldump_all_databases.sql.bz2

# make the backup readable only by root
/bin/chmod 600 mysqldump_all_databases.sql.bz2
