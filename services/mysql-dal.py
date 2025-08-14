import mysql.connector

class Connection:
    def __init__(self):
        conn = mysql.connector.connect(
            host="172.30.173.189",
            user="shukiDB",
            password="shuki!",
            database="mydb"
        )
        cursor = conn.cursor()
    def _connction(self):
        pass


