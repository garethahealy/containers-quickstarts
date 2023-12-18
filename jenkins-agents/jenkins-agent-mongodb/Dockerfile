FROM ghcr.io/garethahealy/containers-quickstarts/jenkins-agent:v4.14@sha256:2d75635d7fc34e2f069a3ebeea1826bd23c4ae44482f47de492bf20f44b5aabb

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