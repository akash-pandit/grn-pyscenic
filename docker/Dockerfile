FROM debian:13-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends wget\
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN sed -i 's/\r$//' /app/scripts/download_mm10_databases.sh

CMD [
    "sed", "-i", "'s/\r$//'", '/app/scripts/download_mm10_databases.sh;',
    "bash", "/app/scripts/download_mm10_databases.sh"
]
