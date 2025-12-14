FROM ubuntu:24.04

RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Goblin binary (Linux)
COPY ./bin/goblin /usr/local/bin/goblin
RUN chmod +x /usr/local/bin/goblin

# Site files
COPY . /app

# IMPORTANT: serve from /app/public
WORKDIR /app/public

ENV PORT=8080
EXPOSE 8080

CMD ["goblin", "start"]