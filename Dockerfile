FROM dpage/pgadmin4:8.5
USER root
RUN setcap -r /usr/bin/python3.11
ENV PGADMIN_LISTN_ADDRESS=0.0.0.0
ENV PGADMIN_DISABLE_POSTFIX=true

COPY render-entrypoint.sh /render-entrypoint.sh
RUN chmod +x /render-entrypoint.sh

ENTRYPOINT ["/render-entrypoint.sh"]
