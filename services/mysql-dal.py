import mysql.connector


conn = mysql.connector.connect(
            host="172.30.173.189",
            user="shukiDB",
            password="shuki!",
            database="mydb"
        )
class Connection:
    def __init__(self,host,user,password,database):
        self.host = host
        self.user = user
        self.password = password
        self.database = database

    def _connction(self):
        self.conn = mysql.connector.connect(
            host= self.host,
            user= self.user,
            password= self.password,
            database= self.database
        )
        self.cursor = conn.cursor()
        return self.cursor
    def _close(self):
        self.cursor.close()
        self.conn.close()


