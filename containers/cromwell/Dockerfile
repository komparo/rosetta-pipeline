FROM openjdk:jre-slim

RUN apt-get update
RUN apt-get install -y wget

RUN mkdir cromwell
RUN wget https://github.com/broadinstitute/cromwell/releases/download/36/cromwell-36.jar -P cromwell