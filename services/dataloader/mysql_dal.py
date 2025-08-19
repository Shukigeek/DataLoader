import mysql.connector
import os



class Connection:
    def __init__(self):
        self.host = os.getenv("MYSQL_HOST","mysql")
        self.user = os.getenv("MYSQL_USER")
        self.password = os.getenv("MYSQL_PASSWORD")
        self.database = os.getenv("MYSQL_DATABASE")
        self.conn = None
        self.cursor = None
    def connect(self):
        self.conn = mysql.connector.connect(
            host= self.host,
            user= self.user,
            password= self.password,
            database= self.database
        )
        self.cursor = self.conn.cursor(dictionary=True)
        return self.cursor
    def close(self):
        self.cursor.close()
        self.conn.close()


