FROM ubuntu:20.04


ARG TERRAFORM_VERSION=1.3.8

ENV TZ="Europe/Vienna"

RUN \
        sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
        apt-get update && \
        apt-get install tzdata -y && \
        apt-get -y upgrade && \
        apt-get install -y build-essential && \
        apt-get install -y software-properties-common && \
        apt-get install -y byobu curl git htop man unzip vim wget jq && \
        rm -rf /var/lib/apt/lists/*


# Download terraform for linux
RUN    wget --progress=dot:mega https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN    wget -qO /usr/local/bin/yq https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 && \
       chmod a+x /usr/local/bin/yq

RUN \
        # Unzip
        unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
        # Move to local bin
        mv terraform /usr/local/bin/ && \
        # Make it executable
        chmod +x /usr/local/bin/terraform && \
        # Check that it's installed
        terraform --version

# Install python
#RUN \
#        apt-get install -y python3-pip && \
#        pip3 install yq 

#RUN ln -s /usr/bin/python3 python


WORKDIR /terraform_scale

ENTRYPOINT ["tail", "-f", "/dev/null"]
