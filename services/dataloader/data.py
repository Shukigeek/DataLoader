from mysql_dal import Connection


class GetData:
    def __init__(self):
        self.conn = Connection()
        self.table = "data"
        if not self.table:
            raise ValueError("MYSQL_TABLE environment variable not set")

    def get_all_table(self):
        cursor = self.conn.connect()
        cursor.execute(f"SELECT * FROM data")
        results = cursor.fetchall()
        self.conn.close()
        return results
