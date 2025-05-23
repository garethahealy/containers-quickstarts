# Builder
FROM registry.access.redhat.com/ubi9/ubi:9.5-1745854298@sha256:f4ebd46d3ba96feb016d798009e1cc2404c3a4ebdac8b2479a2ac053e59f41b4 AS builder

RUN dnf install -y unzip && \
    dnf clean all

# renovate: datasource=github-releases depName=SonarSource/sonar-scanner-cli
ARG SONAR_SCANNER_VERSION=4.8.1.3023
RUN curl -L "https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip" -o /tmp/sonar-scanner.zip && \
    unzip /tmp/sonar-scanner.zip && \
    mv sonar-scanner-* /opt/sonar-scanner && \
    chmod +x /opt/sonar-scanner/bin/sonar-scanner

# renovate: datasource=golang-version depName=go
ARG GO_VERSION=1.24.2
RUN curl -L "https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz" -o /tmp/go.tar.gz && \
    tar -C /usr/local/ -xzf /tmp/go.tar.gz

# Runnable
FROM ghcr.io/redhat-cop/containers-quickstarts/jenkins-agent:v4.18

LABEL name="redhat-cop/jenkins-agent-golang" \
      io.k8s.display-name="Jenkins Agent golang" \
      io.k8s.description="The jenkins agent golang." \
      com.redhat.component="redhat-cop/containers-quickstarts/jenkins-agent-golang"

ENV GOROOT=/usr/local/go \
    GOPATH=/usr/src/go

ENV PATH="$PATH:$GOPATH/bin:$GOROOT/bin"

USER root

COPY --from=builder /opt/sonar-scanner /opt/sonar-scanner
RUN ln -s /opt/sonar-scanner/bin/sonar-scanner /usr/local/bin/sonar-scanner && \
    sonar-scanner -v

COPY --from=builder /usr/local/go /usr/local/go
RUN mkdir -p /usr/src/go/src/redhat && \
    mkdir -p "${HOME}/.cache/go-build" && \
    chown -R 1001 /usr/src/go && \
    chown -R 1001 /usr/local/go && \
    chown -R 1001 "${HOME}/.cache/go-build"

USER 1001

RUN go version && \
    go env