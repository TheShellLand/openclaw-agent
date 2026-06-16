#FROM node:latest
FROM pi-agent:latest

RUN apt update; apt install -y vim curl wget unzip build-essential python3-dev
RUN curl -fsSL https://bootstrap.pypa.io/get-pip.py | python3 - --break-system-packages
RUN python3 -m pip install -U pip --break-system-packages
RUN curl -fsSL https://pi.dev/install.sh | sh
RUN pi update
RUN curl -fsSL https://openclaw.ai/install.sh | bash

COPY models.json /root/.pi/agent/models.json

VOLUME /root/.pi/agent/sessions

WORKDIR /root

EXPOSE 3001
EXPOSE 18789

ENV OLLAMA_CONTEXT_LENGTH=256000
