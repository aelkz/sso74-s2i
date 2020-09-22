https://catalog.redhat.com/software/containers/rh-sso-7/sso74-openshift-rhel8/5e7e033d5a1346687697bbd3

docker login registry.redhat.io
docker pull registry.redhat.io/rh-sso-7/sso74-openshift-rhel8

registry.redhat.io/rh-sso-7/sso74-openshift-rhel8                                                 latest              82c17faee0ab        7 weeks ago         1GB
registry.redhat.io/rh-sso-7/sso74-openshift-rhel8                                                 <none>              54d17073f7f9        7 weeks ago         998MB
registry.redhat.io/rh-sso-7/sso74-openshift-rhel8                                                 7.4                 bf888426f330        2 months ago        1.01GB

docker run -d -p 8080:8080 -p 8443:8443 registry.redhat.io/rh-sso-7/sso74-openshift-rhel8:latest
docker run -p 8080:8080 -p 8443:8443 registry.redhat.io/rh-sso-7/sso74-openshift-rhel8:latest

docker ps
>>> ad41f14cb0a1

docker exec -it ad41f14cb0a1 /bin/bash

# /opt/eap/standalone/configuration/standalone-openshift.xml

docker cp ad41f14cb0a1:/opt/eap/standalone/configuration/standalone-openshift.xml .

-----

cd /usr/local/s2i/

----

sso74-oracle
soo74-postgres
sso74-xs-oracle (+ datagrid)
sso74-xs-postgres (+ datagrid)

-----

docker run --user root --rm -it --name sso74-openshift-rhel8 -P --entrypoint "/bin/bash" registry.redhat.io/rh-sso-7/sso74-openshift-rhel8:7.4

-----

[jboss@c04cad7d05f0 launch]$ ls -la **common.sh*
-rw-rw-r-- 1 jboss root 16777 Jul 31 13:07 datasource-common.sh
-rw-rw-r-- 1 jboss root   930 Jul 31 13:07 launch-common.sh
-rw-rw-r-- 1 jboss root   871 Jul 31 13:07 login-modules-common.sh
-rw-rw-r-- 1 jboss root   493 Jul 31 13:07 management-common.sh
-rw-rw-r-- 1 jboss root  2069 Jul 31 13:08 openshift-common.sh
-rw-rw-r-- 1 jboss root  4999 Jul 31 13:07 openshift-migrate-common.sh
-rw-rw-r-- 1 jboss root  7703 Jul 31 13:07 resource-adapters-common.sh
[jboss@c04cad7d05f0 launch]$ pwd
/opt/eap/bin/launch

-----

s2i build --copy . registry.redhat.io/rh-sso-7/sso74-openshift-rhel8:latest sso74-custom -e MY_ENV=true --loglevel=5 --incremental=true --run

$ s2i build ~/demo registry.redhat.io/rh-sso-7/sso74-openshift-rhel8:latest test-sso74-custom-s2i -e APP_ENV=prod -e APP_SECRET=foobar123 --loglevel=5 --incremental=true

-----

./jboss-cli.sh --connect --controller=127.0.0.1:9990

-----

docker system prune
