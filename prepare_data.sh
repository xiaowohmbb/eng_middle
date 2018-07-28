#!/bin/bash
mysqlHost=localhost
mysqlPort=3306
mysqlUser=root
mysqlPasswd=123456
mysqlDatabase=test

mysqlCmd="mysql --local-infile -h${mysqlHost} -P${mysqlPort} -D${mysqlDatabase} -u${mysqlUser} -p${mysqlPasswd}"

$mysqlCmd -e "CREATE DATABASE IF NOT EXISTS test";
$mysqlCmd -e "CREATE DATABASE IF NOT EXISTS test1";
$mysqlCmd -e "CREATE DATABASE IF NOT EXISTS test2";
$mysqlCmd -e "create table IF NOT EXISTS test.t_name(id int primary key,name varchar(250));";
$mysqlCmd -e "drop table IF EXISTS test.t_name2";
$mysqlCmd -e "create table IF NOT EXISTS test.t_name2(id int primary key,name varchar(250));";
$mysqlCmd -e "create table IF NOT EXISTS test1.t_address(id int primary key,address varchar(250));";
$mysqlCmd -e "create table IF NOT EXISTS test2.t_name_address(id int primary key,name varchar(250),address varchar(250));";
$mysqlCmd -e "insert ignore into test.t_name values (1,'a')";
$mysqlCmd -e "insert ignore into test1.t_address values (1,'b')";
tmpFile="/tmp/t_name.csv"
rm -f $tmpFile
$mysqlCmd -e "select id,name from test.t_name into outfile '$tmpFile' fields terminated by '\t' "
$mysqlCmd -e "load data local infile '$tmpFile' into table test.t_name2 fields terminated by '\t' " 
