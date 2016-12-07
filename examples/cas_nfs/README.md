# JupyterHub on Kubernetes with CAS and NFS

## Cas

use exist cas server, 

ref http://git.n.xiaomi.com/liupengcheng/jhub_cas_authenticator

## NFS

```
$ kubectl create -f nfs.yml
```

1. Get service Cluster-IP for the `jupyterhub-nfs` service: `kubectl get service | grep jupyterhub-nfs`
2. Edit the `nfs2.yml` file and replace `{{ X.X.X.X }}` with the ip of the service found in (1)

```
$ kubectl create -f nfs2.yml
```

Two services are now running:

1. `jupyterhub-nfs`: NFS server
2. `jupyterhub-nfs-web`: An optional simple NGINX (`autoindex: on;`) to browse the files

One Persistent Volume Claim (`jupyterhub-volume`) is ready for the JupyterHub single user pods.

## JupyterHub

1. Get service Cluster-IP for the `jupyterhub-ldap` service: `kubectl get service | grep jupyterhub-ldap`
2. Edit the `hub.yml` file and replace `{{ LDAP_SERVICE }}` with the ip of the service found in (1)

```
$ kubectl create -f hub.yml
```

Two services are now running:

1. `jupyterhub`: Main JupyterHub UI. Login as any LDAP user as defined in the ConfigMap
2. `jupyterhub-api`: JupyterHub API - not really useful for users
