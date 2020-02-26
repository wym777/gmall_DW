#!/bin/bash

ps -ef|grep /usr/local/nginx/sbin/nginx|grep -v grep

if [ $? = 1 ];then
    ssh H2 "/usr/local/nginx/sbin/nginx"
fi

