FROM ubuntu

RUN apt-get update
RUN apt-get install -y wget curl

# install docker (for mysql server)
RUN apt-get update && \
    apt-get -y install apt-transport-https \
        ca-certificates \
        curl \
        gnupg2 \
        software-properties-common && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable" && \
    apt-get update && \
    apt-get -y install docker-ce

# install cromwell
RUN apt-get install -y openjdk-8-jre curl
RUN mkdir cromwell
RUN wget https://github.com/broadinstitute/cromwell/releases/download/36/cromwell-36.jar -P cromwell