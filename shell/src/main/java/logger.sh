#!/bin/bash

case $1 in
"start"){
    echo "=========start-logger========"
    for host in H2 H3 H4 ; do

        echo "========start-$host======="

        ssh $host "/opt/module/jdk1.8/bin/java -jar /gmall/logger-0.0.1-SNAPSHOT.jar >/dev/null 2>&1 &"

        ssh $host "jps"

    done


    ps -ef|grep /usr/local/nginx/sbin/nginx|grep -v grep

    if [ $? = 1 ];then
        ssh H2 "/usr/local/nginx/sbin/nginx"
    fi

};;

"stop"){

 echo "=========stop-logger========"
    for host in H2 H3 H4 ; do

        echo "========start-$host======="

        ssh $host "ps -ef|grep logger-0.0.1-SNAPSHOT.jar|grep -v grep|awk '{print \$2}'|xargs kill"

        ssh $host "jps"

        ps -ef|grep /usr/local/nginx/sbin/nginx|grep -v grep|awk '{print $2}'

    done
     ps -ef|grep /usr/local/nginx/sbin/nginx|grep -v grep

    if [ $? = 0 ];then
        ssh H2 "/usr/local/nginx/sbin/nginx -s stop"
    fi

};;
esac