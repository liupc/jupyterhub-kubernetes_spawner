docker build -t jupyterhub .  --no-cache=true
build=`docker images | grep "^jupyterhub " | awk '{print $3}'`
docker tag $build docker.d.xiaomi.net/u/liushaohui/jupyterhub-kube-ldap-nfs
docker push docker.d.xiaomi.net/u/liushaohui/jupyterhub-kube-ldap-nfs
