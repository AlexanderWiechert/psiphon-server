FROM ubuntu:mantic-20240405

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ="Europe/Berlin"

RUN apt-get update && apt-get install wget -y && \
    apt-get clean && \
    mkdir -p /opt/psiphond-server && \
    cd /opt/psiphond-server/ && \
    wget https://github.com/Psiphon-Labs/psiphon-tunnel-core-binaries/raw/master/psiphond/psiphond  && \
    chmod 755 /opt/psiphond-server/psiphond  && \
    ./psiphond -ipaddress 0.0.0.0  -protocol OSSH:9991 generate   && \
    ls -la /opt/psiphond-server/  && \
    echo "\n" && echo "### Note client token ###" && cat server-entry.dat ; echo && echo "### Note client token ###"

WORKDIR /opt/psiphond-server/
CMD [ "./psiphond", "run" ]
