import logging
from mysql_connect import ConnMySqlBase

logging.basicConfig(level=logging.INFO)



mysqlConnect = ConnMySqlBase('config.ini','mysql')



def join_name_address():
    sql = '''
        insert into test2.t_name_address
        select a.id,a.name,b.address
        from test.t_name a 
        join test1.t_address b
        on a.id = b.id
    '''
    mysqlConnect.execute(sql)
    mysqlConnect.commit()
    logging.info('join_name_address success')

def main():
    join_name_address();
    
    mysqlConnect.close();
    logging.info('close mysql')


if __name__ == '__main__':
    main()
