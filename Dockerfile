FROM ansible/awx_web:latest
LABEL maintainer="Jeffery Bagirimvano <jefferyb@uark.edu>"

USER root

RUN yum update -y && \
  pip install pywinrm[credssp] requests-credssp psycopg2 pyvmomi zabbix-api

ADD ansible.cfg /etc/ansible/ansible.cfg

USER 1000  
