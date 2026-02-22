FROM ghcr.io/chartdb/chartdb:latest

ENV PORT=10000

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
