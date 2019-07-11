FROM ansible/awx_web:latest
LABEL maintainer="Jeffery Bagirimvano <jefferyb@uark.edu>"

USER root

ENV PIP_PACKAGES='pywinrm[credssp] requests-credssp psycopg2 pyvmomi zabbix-api'

RUN yum update -y && \
  . /var/lib/awx/venv/awx/bin/activate && \
  pip install ${PIP_PACKAGES} && \
  deactivate && \
  pip install ${PIP_PACKAGES}

ADD ansible.cfg /etc/ansible/ansible.cfg

USER 1000  
