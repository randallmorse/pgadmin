FROM dpage/pgadmin4:8.4
USER root
RUN setcap -r /usr/bin/python3.11
ENV PGADMIN_LISTN_ADDRESS=0.0.0.0
ENV PGADMIN_DISABLE_POSTFIX=true
USER pgadmin
