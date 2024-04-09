FROM dpage/pgadmin4:8.4
USER root
RUN setcap -r /usr/bin/python3.11
ENV PGADMIN_LISTN_ADDRESS=0.0.0.0
ENV PGADMIN_DISABLE_POSTFIX=true

COPY <<EOF /pgadmin4/pgpassfile
${PGADMIN_DATABASE_NAME}:5432:${PGADMIN_DATABASE_USER}:${PGADMIN_DATABASE_PASSWORD}
EOF

COPY <<EOF /pgadmin4/servers.json
{
  "Servers": {
    "1": {
      "Name": "${PGADMIN_DATABASE_NAME}",
      "Group": "Servers",
      "Port": 5432,
      "Username": "${PGADMIN_DATABASE_USER}",
      "PassFile": "/pgadmin4/pgpassfile",
      "Host": "${PGADMIN_DATABASE_HOST}",
      "SSLMode": "prefer",
      "MaintenanceDB": "postgres"
    }
  }
}

EOF

USER pgadmin
