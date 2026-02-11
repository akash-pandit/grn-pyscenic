FROM debian:13-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    wget \
    ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY ./scripts/download_mm10_databases.sh .

RUN sed -i 's/\r$//' "download_mm10_databases.sh"

CMD ["bash", "download_mm10_databases.sh"]
