FROM quay.io/openshift/origin-jenkins-agent-base:4.2

LABEL com.redhat.component="redhat-cop/tekton-agent-base" \
      name="redhat-cop/tekton-agent-base" \
      version="4.2" \
      architecture="x86_64" \
      release="1" \
      io.k8s.display-name="Tekton Agent Base" \
      io.k8s.description="The tekton agent base image on top of the ubi8 base image." \
      io.openshift.tags="openshift,tekton,agent,ansible"

ADD tekton-agents/tekton-agent-ansible/ubi.repo /etc/yum.repos.d/ubi.repo
COPY tekton-agents/tekton-agent-ansible/contrib/bin/ /usr/local/bin/

ENV BASH_ENV=/usr/local/bin/scl_enable \
    ENV=/usr/local/bin/scl_enable \
    PROMPT_COMMAND="./usr/local/bin/scl_enable" \
    LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

RUN curl -L https://github.com/krallin/tini/releases/download/v0.18.0/tini-static-amd64 -o /usr/bin/tini && \
    chmod 775 /usr/bin/tini

RUN INSTALL_PKGS="rh-python36-python-pip" && \
    DISABLE_REPOS=--disablerepo='rhel-*' && \
    yum $DISABLE_REPOS install -y $INSTALL_PKGS && \
    rm -rf /var/cache/yum && \
    yum $DISABLE_REPOS clean all -y

USER 1001
