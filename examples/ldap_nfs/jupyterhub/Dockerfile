FROM jupyterhub/jupyterhub

RUN mv /etc/apt/sources.list /etc/apt/sources.list.backup
ADD 163.sources.list /etc/apt/sources.list

RUN apt-get update && apt-get install -y curl
RUN pip install jupyterhub-ldapauthenticator

# branch name is not supported in following cmd
# RUN pip install git+http://git.n.xiaomi.com/infra/jupyterhub-kubernetes_spawner.git@xm
RUN pip install git+git://github.com/lshmouse/jupyterhub-kubernetes_spawner.git

USER root
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

CMD ["/startup.sh"]
