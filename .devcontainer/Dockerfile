FROM node:24-trixie

ARG USERNAME=node
ENV DEVCONTAINER=true

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
    sudo \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN echo ${USERNAME} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USERNAME} \
    && chmod 0440 /etc/sudoers.d/${USERNAME}

RUN mkdir -p /workspaces/devcontainers/node_modules \
    && chown -R ${USERNAME}:${USERNAME} /workspaces/devcontainers/node_modules

USER ${USERNAME}

RUN echo 'alias g="git"' >> /home/${USERNAME}/.bash_aliases
