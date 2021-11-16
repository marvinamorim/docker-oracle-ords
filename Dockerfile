FROM openjdk:8-jre-alpine
LABEL maintainer="Martin DSouza <martin@talkapex.com>"

ENV APEX_CONFIG_DIR="/opt" \
    ORDS_DIR="/ords"

WORKDIR ${ORDS_DIR}

COPY ["files/ords-*.zip", "scripts/*", "/tmp/"]

RUN unzip /tmp/ords-*.zip ords.war && \
    rm -rf /tmp/ords-*.zip && \
    chmod +x /tmp/docker-run.sh && \
    /tmp/docker-run.sh