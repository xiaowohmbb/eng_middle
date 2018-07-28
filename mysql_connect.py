# coding: utf-8

import pymysql
import configparser
from retrying import retry


class ConnMySqlBase(object):

    @retry(stop_max_attempt_number=5, wait_fixed=5000)
    def __init__(self, path, section):
        config = configparser.ConfigParser()
        config.read(path)
        host = config.get(section, "host")
        port = int(config.get(section, "port"))
        database = config.get(section, "db")
        user = config.get(section, "user")
        password = config.get(section, "passwd")
        self.conn = pymysql.connect(
            db=database, user=user, passwd=password, host=host, port=port)

    @retry(stop_max_attempt_number=5, wait_fixed=5000)
    def execute(self, sql):
        cur = self.conn.cursor()
        cur.execute(sql)

    @retry(stop_max_attempt_number=5, wait_fixed=5000)
    def select(self, sql):
        cur = self.conn.cursor()
        cur.execute(sql)
        return cur.fetchall()

    def rollback(self):
        self.conn.rollback()

    def commit(self):
        self.conn.commit()

    def close(self):
        self.conn.close()