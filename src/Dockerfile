FROM python:3.12-slim

WORKDIR /app

RUN apt-get update \
 && apt-get install -y --no-install-recommends ca-certificates curl \
 && curl -fsSLo /usr/local/bin/kubectl "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
 && chmod +x /usr/local/bin/kubectl \
 && apt-get purge -y --auto-remove curl \
 && rm -rf /var/lib/apt/lists/*

COPY app.py /app/app.py
COPY metrics.sh /app/metrics.sh

RUN chmod +x /app/metrics.sh \
 && pip install --no-cache-dir flask

EXPOSE 8080

CMD ["python", "/app/app.py"]
