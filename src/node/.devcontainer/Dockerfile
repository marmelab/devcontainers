FROM node:${templateOption:imageVariant}

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
    sudo \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

ARG USERNAME=node
RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

USER node

ENV DEVCONTAINER=true
