FROM openjdk:11

WORKDIR /opt

COPY . .

RUN wget -O /opt/apache-activemq-5.17.1.tar.gz https://archive.apache.org/dist/activemq/5.17.1/apache-activemq-5.17.1-bin.tar.gz
RUN tar -axvf /opt/apache-activemq-5.17.1.tar.gz
RUN mv /opt/apache-activemq-5.17.1 /opt/apache-activemq
RUN ln -s /opt/apache-activemq/bin/activemq /usr/bin/activemq

EXPOSE 1883
EXPOSE 8161

USER root

CMD [ "activemq", "console" ]

# docker build -t activemq:v5.17.1 .

# docker save -o activemq-5.17.1.tar

# docker load -i activemq-5.17.1.tar

# docker run -it -p 1883:1883 -p 8161:8161 activemq:v5.17.1 /bin/bash

# docker run -d -p 1883:1883 -p 8161:8161 activemq:v5.17.1