 #!/bin/bash

 dbuser=xxxx
 dbpass=xxxx
 olddb=xxxx
 newdb=xxxx

 mysqlconn="mysql -u $dbuser -p$dbpass -h localhost"

 $mysqlconn -e "CREATE DATABASE $newdb"
 params=$($mysqlconn -N -e "SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE table_schema='$olddb'")

 for name in $params; do
       $mysqlconn -e "RENAME TABLE $olddb.$name to $newdb.$name";
       echo "Renamed $olddb.$name to $newdb.$name";
 done;

 #$mysqlconn -e "DROP DATABASE $olddb"