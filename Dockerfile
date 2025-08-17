FROM python:3.10-slim

WORKDIR /app

COPY . .


RUN pip install -r requirements.txt --no-cache-dir --upgrade mysql-connector-python

EXPOSE 8000

CMD ["uvicorn", "services.dataloader.main:app", "--host", "0.0.0.0", "--port", "8000"]