# Builder
FROM registry.access.redhat.com/ubi9/ubi:9.5-1745854298@sha256:f4ebd46d3ba96feb016d798009e1cc2404c3a4ebdac8b2479a2ac053e59f41b4  AS builder

# renovate: datasource=repology depName=homebrew/openshift-cli
ARG OC_VERSION=4.18.10
RUN curl -L "https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${OC_VERSION}/openshift-client-linux-amd64-rhel8.tar.gz" -o /tmp/openshift-client-linux.tar.gz && \
    tar --no-same-owner -xzf /tmp/openshift-client-linux.tar.gz && \
    mv oc kubectl /usr/local/bin && \
    oc version --client && \
    kubectl version --client

# Runnable
FROM quay.io/openshift/origin-jenkins-agent-base:4.16@sha256:c241c971aef8b6fdfd98e3dcac04a98f4ac1fea0b87099f8cf740c1ce97fa3b5

LABEL name="redhat-cop/jenkins-agent" \
      io.k8s.display-name="Jenkins Agent Base" \
      io.k8s.description="The jenkins agent base." \
      io.openshift.tags="openshift,jenkins,agent,ansible" \
      com.redhat.component="redhat-cop/containers-quickstarts/jenkins-agent" \
      release="1" \
      architecture="x86_64" \
      maintainer="github.com/redhat-cop"

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

USER root

RUN rm -f /etc/yum.repos.d/*.repo
COPY ubi8.repo /etc/yum.repos.d/ubi8.repo

RUN dnf -y update && \
    dnf -y install java-21-openjdk-headless java-17-openjdk-headless && \
    dnf clean all

RUN alternatives --set java "$(alternatives --display java | grep 'family java-21-openjdk' | cut -d ' ' -f 1)"

COPY --from=builder /usr/local/bin/oc /usr/local/bin/oc
COPY --from=builder /usr/local/bin/kubectl /usr/local/bin/kubectl

USER 1001

RUN oc version --client && \
    kubectl version --client
