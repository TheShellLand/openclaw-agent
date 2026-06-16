#FROM node:latest
FROM pi-agent:latest

RUN curl -fsSL https://openclaw.ai/install.sh | bash

COPY openclaw.json /root/.openclaw/openclaw.json

WORKDIR /root

EXPOSE 3001
EXPOSE 18789

ENV OLLAMA_CONTEXT_LENGTH=256000
ENV OPENCLAW_GATEWAY_PASSWORD=hello
