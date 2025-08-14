from fastapi import FastAPI
from services.dataloader.data import GetData

app = FastAPI()
db = GetData().get_all_table()
@app.post("/data")
def get_all_table():
    return db

