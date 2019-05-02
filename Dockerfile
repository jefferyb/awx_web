FROM ansible/awx_web:4.0.0
LABEL maintainer="Jeffery Bagirimvano <jefferyb@uark.edu>"

USER root

RUN yum update -y && \
  pip install pywinrm[credssp] requests-credssp psycopg2 pyvmomi zabbix-api

ADD ansible.cfg /etc/ansible/ansible.cfg

USER 1000  
