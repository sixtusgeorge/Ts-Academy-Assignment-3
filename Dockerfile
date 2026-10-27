FROM ubuntu:24.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    iputils-ping \
    netcat-openbsd \
    procps \
    coreutils \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY app/ /app/
RUN chmod +x /app/*.sh

ENTRYPOINT ["/app/app.sh"]
CMD ["help"]
