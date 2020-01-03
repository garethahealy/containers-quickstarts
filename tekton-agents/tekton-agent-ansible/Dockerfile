FROM quay.io/openshift/origin-jenkins-agent-base:4.2

LABEL com.redhat.component="redhat-cop/tekton-agent-ansible" \
      name="redhat-cop/tekton-agent-ansible" \
      version="4.2" \
      architecture="x86_64" \
      release="1" \
      io.k8s.display-name="Tekton Agent Ansible" \
      io.k8s.description="The tekton agent ansible image has ansible on top of the ubi8 base image." \
      io.openshift.tags="openshift,tekton,agent,ansible"

ENV ANSIBLE_VERSION=2.8.2

ADD tekton-agents/tekton-agent-ansible/ubi.repo /etc/yum.repos.d/ubi.repo

RUN INSTALL_PKGS="rh-python36-python-pip" && \
    DISABLE_REPOS=--disablerepo='rhel-*' && \
    yum $DISABLE_REPOS install -y $INSTALL_PKGS && \
    source scl_source enable rh-python36 && \
    scl enable rh-python36 bash && \
    python3 -m pip install ansible==$ANSIBLE_VERSION paramiko && \
    yum $DISABLE_REPOS clean all -y && \
    rm -rf /var/cache/yum

ADD tekton-agents/tekton-agent-ansible/scl_enable /usr/share/container-scripts/
ENV BASH_ENV=/usr/share/container-scripts/scl_enable \
    ENV=/usr/share/container-scripts/scl_enable \
    PROMPT_COMMAND="./usr/share/container-scripts/scl_enable"

USER 1001
