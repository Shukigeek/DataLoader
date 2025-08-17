from fastapi import FastAPI
from services.dataloader.data import GetData
import os

app = FastAPI()

@app.get("/data")
def get_all_table():
    print("DEBUG ENV:", os.getenv("MYSQL_HOST"), os.getenv("MYSQL_USER"), os.getenv("MYSQL_PASSWORD"),
          os.getenv("MYSQL_DATABASE"))

    db = GetData().get_all_table()
    print("data",db)
    return {"data": db}

get_all_table()
