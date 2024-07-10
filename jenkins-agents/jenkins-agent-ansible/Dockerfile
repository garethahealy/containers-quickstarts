FROM ghcr.io/redhat-cop/containers-quickstarts/jenkins-agent:v4.16@sha256:9456e8d3762e82e9e8a02488b4c4e045aadf7bffb92664e8e4b70da8e316f2ce

LABEL name="redhat-cop/jenkins-agent-ansible" \
      io.k8s.display-name="Jenkins Agent Ansible" \
      io.k8s.description="The jenkins agent ansible image has ansible on top of the jenkins agent base image." \
      com.redhat.component="redhat-cop/containers-quickstarts/jenkins-agent-ansible"

USER root

COPY requirements.txt /requirements.txt
RUN dnf -y install --nodocs python3.11 python3.11-pip && \
    dnf clean all && \
    pip3.11 install --no-cache-dir -r /requirements.txt

USER 1001

RUN ansible --version