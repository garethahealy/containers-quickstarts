FROM ghcr.io/redhat-cop/containers-quickstarts/jenkins-agent:v4.16@sha256:9456e8d3762e82e9e8a02488b4c4e045aadf7bffb92664e8e4b70da8e316f2ce

LABEL name="redhat-cop/jenkins-agent-mongodb" \
      io.k8s.display-name="Jenkins Agent mongodb" \
      io.k8s.description="The jenkins agent mongodb." \
      com.redhat.component="redhat-cop/containers-quickstarts/jenkins-agent-mongodb"

USER root

COPY mongodb-org.repo /etc/yum.repos.d/
RUN dnf install --nodocs -y mongodb-org-tools mongodb-org-shell && \
    dnf clean all

USER 1001

RUN mongo --version