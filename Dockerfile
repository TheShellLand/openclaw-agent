FROM node:latest
# FROM pi-agent:latest

# docker-out-of-docker
RUN apt update && apt install -y ca-certificates
COPY --from:docker:latest /usr/local/bin/docker /uar/local/bin/docker

RUN curl -fsSL https://openclaw.ai/install.sh | bash

COPY openclaw.json /root/.openclaw/openclaw.json
COPY entry.sh /entry.sh

WORKDIR /root

EXPOSE 3001
EXPOSE 18789

ENV OLLAMA_CONTEXT_LENGTH=256000
ENV OPENCLAW_GATEWAY_PASSWORD=hello

ENTRYPOINT ["/bin/bash", "/entry.sh"]
