FROM rust:latest

LABEL maintainer="Arash Afshar <arash@polymath.network>"
LABEL name="rust"
LABEL version="latest"

RUN rustup toolchain install nightly
RUN rustup default nightly
RUN curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh

RUN apt update && \
    apt install cmake pkg-config git gcc build-essential git clang \
    libclang-dev curl ca-certificates libssl-dev -y --no-install-recommends
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt install nodejs g++ make yarn -y --no-install-recommends && \
    apt autoremove -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*
