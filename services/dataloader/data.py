import os

from mysql_dal import Connection


class GetData:
    def __init__(self):
        self.conn = Connection()
        self.table = os.getenv("MYSQL_TABLE","data")
        if not self.table:
            raise ValueError("MYSQL_TABLE environment variable not set")

    def get_all_table(self):
        cursor = self.conn.connect()
        cursor.execute(f"SELECT * FROM {self.table}")
        results = cursor.fetchall()
        self.conn.close()
        return results
