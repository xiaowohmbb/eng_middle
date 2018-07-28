#!/bin/bash
mysqlHost=localhost
mysqlPort=3306
mysqlUser=root
mysqlPasswd=root
mysqlDatabase=test

mysqlCmd=mysql -h ${mysqlHost} -P ${mysqlPort} -D ${mysqlDatabase} -u ${mysqlUser} -p ${mysqlPasswd}

$mysqlCmd -e "CREATE DATABASE IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET utf8 */";
$mysqlCmd -e "CREATE DATABASE IF NOT EXISTS `test1` /*!40100 DEFAULT CHARACTER SET utf8 */";
$mysqlCmd -e "CREATE DATABASE IF NOT EXISTS `test2` /*!40100 DEFAULT CHARACTER SET utf8 */";
$mysqlCmd -e "create table IF NOT EXISTS test.t_name(id int primary key,name varchar(250));";
$mysqlCmd -e "create table IF NOT EXISTS test1.t_address(id int primary key,address varchar(250));";
$mysqlCmd -e "create table IF NOT EXISTS test2.t_name_address(id int primary key,name varchar(250),address varchar(250));";
$mysqlCmd -e "insert into test.t_name values (1,'a')";
$mysqlCmd -e "insert into test1.t_address values (1,'b')";