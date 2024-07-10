FROM ghcr.io/redhat-cop/containers-quickstarts/jenkins-agent:v4.16@sha256:9456e8d3762e82e9e8a02488b4c4e045aadf7bffb92664e8e4b70da8e316f2ce

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

LABEL name="redhat-cop/jenkins-agent-rust" \
      io.k8s.display-name="Jenkins Agent rust" \
      io.k8s.description="The jenkins agent rust." \
      com.redhat.component="redhat-cop/containers-quickstarts/jenkins-agent-rust"

ENV PATH="$PATH:$HOME/.cargo/bin"

USER root

RUN dnf install --nodocs -y gcc && \
    dnf clean all && \
    curl https://sh.rustup.rs -sSf | sh -s -- -y

USER 1001

RUN rustc -V