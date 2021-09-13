FROM ubuntu:20.04

RUN apt-get update && \
  apt-get install -y curl git python3-venv

RUN useradd -m builder
ENV SHELL=/bin/bash
USER builder
WORKDIR /home/builder
RUN mkdir -p /home/builder/.local/share
COPY --chown=builder:builder . /home/builder/.local/share/wildenv

RUN echo "source /home/builder/.local/share/wildenv/wildenv-hook" >> /home/builder/.bashrc
