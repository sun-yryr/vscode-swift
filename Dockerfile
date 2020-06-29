FROM swift:5.1.3-bionic

WORKDIR /app

RUN apt update && apt install wget -y

RUN wget https://nodejs.org/dist/v12.18.1/node-v12.18.1-linux-x64.tar.xz

RUN tar Jxfv node-v12.18.1-linux-x64.tar.xz && \
    mv ./node-v12.18.1-linux-x64 ./node-12.18.1

ENV PATH=${PATH}:/app/node-12.18.1/bin

RUN apt install python3-pip -y

RUN pip3 install online-judge-tools && npm install -g atcoder-cli

ENTRYPOINT ["/bin/bash"]
