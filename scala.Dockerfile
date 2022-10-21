FROM ubuntu
RUN apt-get update && \
    apt-get install openjdk-18-jre-headless curl -y && \
    useradd -ms /bin/bash developer
USER developer
WORKDIR /home/developer
RUN curl -fL https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz | gzip -d > cs && \
    chmod +x cs && \
    ./cs setup --yes && \
    echo 'PATH="$PATH:/home/developer/.local/share/coursier/bin"' >> /home/developer/.bashrc && \
    rm /home/developer/cs
