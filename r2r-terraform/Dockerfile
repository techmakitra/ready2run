
FROM  ubuntu:20.04 AS cloudstarter-base

ENV TERM xterm-256color
ENV CS_SCRIPTS_DIR /cloudstarter/scripts
ENV CS_RAM_DRIVE_DIR /dev/ram


RUN apt-get update && apt-get -y install curl wget gnupg gnupg2 gnupg1 software-properties-common

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg \
    | apt-key add - \
    && apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(/usr/bin/lsb_release -cs) main" \
    && apt-get update && apt-get -y install terraform \
    && terraform -version \
    && apt-get -y install zip

RUN mkdir /cloudstarter && mkdir /cloudstarter/commands && mkdir /workspace
COPY ./scripts/common/ /cloudstarter/scripts
COPY ./commands/ /cloudstarter/commands/
RUN chmod +x -R /cloudstarter/commands/*


RUN echo "source $CS_SCRIPTS_DIR/cloudstarter-common-functions.sh" >> /etc/bash.bashrc 
RUN echo "source $CS_SCRIPTS_DIR/cloudstarter-functions.sh" >> /etc/bash.bashrc 

ONBUILD WORKDIR /workspace
ONBUILD RUN chmod +rw /workspace

################################################################
FROM cloudstarter-base AS cloudstarter-gcp

ENV CS_CLOUD_CLI_DIR /root/.config/gcloud

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" \  
    |  tee -a /etc/apt/sources.list.d/google-cloud-sdk.list  \
    && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg \
    |  apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - \
    && apt-get update -y && apt-get install google-cloud-sdk -y

COPY ./scripts/gcp/  /cloudstarter/scripts

ENTRYPOINT ["bash", "/cloudstarter/scripts/cloudstarter-entry.sh"]

################################################################
FROM cloudstarter-base as cloudstarter-azure

ENV CS_CLOUD_CLI_DIR /root/.azure

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

COPY ./scripts/azure/  /cloudstarter/scripts

ENTRYPOINT ["bash", "/cloudstarter/scripts/cloudstarter-entry.sh"]