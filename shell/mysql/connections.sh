#!/bin/sh

host=$1
user=$2
password=$3

sql="
SELECT substring_index(\`HOST\`, ':', 1) AS hostname, COUNT(\`HOST\`) AS num 
FROM information_schema.processlist GROUP BY hostname ORDER BY num DESC;"

while true
do
    mysql -h $host -u$user -p$password -e "$sql"
    sleep 1
    clear
done
