FROM ansible/awx_web:5.0.0
LABEL maintainer="Jeffery Bagirimvano <jefferyb@uark.edu>"

ENV PIP_PACKAGES='pywinrm[credssp] requests-credssp psycopg2 pyvmomi zabbix-api ansible-tower-cli'

RUN . /var/lib/awx/venv/awx/bin/activate && \
  pip install --user ${PIP_PACKAGES} && \
  deactivate && \
  pip install --user ${PIP_PACKAGES}

ADD ansible.cfg /etc/ansible/ansible.cfg
