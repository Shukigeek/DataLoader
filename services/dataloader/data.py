from services.dataloader.mysql_dal import Connection
import os


class GetData:
    def __init__(self):
        self.conn = Connection()
        self.table = os.getenv("MYSQL_TABLE")
    def get_all_table(self):
        conn = self.conn.connect()
        res = conn.execute(f"SELECT * FROM {self.table}")
        return res
