from ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=US

RUN apt-get update

RUN apt-get -y install bash-completion wget \
 build-essential \
 libreadline-dev \
 x11-apps \
 xdg-utils \
 libasound2 \
 xdg-utils \
 unzip \
 && rm -rf /usr/share/doc/* && \
 rm -rf /usr/share/info/* && \
 rm -rf /tmp/* && \
 rm -rf /var/tmp/*

RUN mkdir -p /usr/share/desktop-directories/ && \
    mkdir -p /database_drivers

RUN cd /database_drivers && \
    wget https://jdbc.postgresql.org/download/postgresql-42.2.19.jar

RUN wget https://s3.amazonaws.com/publicsctdownload/Ubuntu/aws-schema-conversion-tool-1.0.latest.zip \
    && unzip aws-schema-conversion-tool-1.0.latest.zip -d .

COPY db2jcc4.jar /database_drivers

RUN dpkg -i aws-schema-conversion-tool*.deb

CMD ["/opt/aws-schema-conversion-tool/bin/AWSSchemaConversionTool"]

