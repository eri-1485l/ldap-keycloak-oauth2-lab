FROM python:3.11-slim
WORKDIR /app

RUN apt-get update && apt-get install -y nginx-extras && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app ./app

COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx-api.conf /etc/nginx/conf.d/default.conf
RUN rm -f /etc/nginx/sites-enabled/default

EXPOSE 8000

CMD ["sh", "-c", "uvicorn app.main:app --host 127.0.0.1 --port 8001 & sleep 2 && nginx -g 'daemon off;'"]
