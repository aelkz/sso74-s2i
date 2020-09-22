Red Hat Single Sign-On 7.4 custom image example with s2i

<p align="left">
<img src="https://raw.githubusercontent.com/aelkz/sso74-s2i/master/_images/sso74-openshift-rhel8.png" title="Red Hat Single Sign-On" width="25%" height="25%" />
</p>

### INSTALLATION STEPS

Navigate to the root of the s2i project:
```
cd sso74-s2i
```

List all files (double check):
```
ls -la
  rwxr-xr-x  ..    ./
  rwxr-xr-x  ..    ../
  rwxr-xr-x  ..    .idea/
  rwxr-xr-x  ..    .s2i/
  rwxr-xr-x  ..    _images/
  rwxr-xr-x  ..    openshift/
  rwxr-xr-x  ..    s2i-config/
  rw-r--r--  ..    HISTORY.md
  rw-r--r--  ..    README.md
  rw-r--r--  ..    pom.xml
  rw-r--r--  ..    sso74-s2i.iml
```

Pull the base image:
```
docker pull registry.redhat.io/rh-sso-7/sso74-openshift-rhel8:latest
```

Then, build the custom image with s2i:
```
s2i build --copy . registry.redhat.io/rh-sso-7/sso74-openshift-rhel8:latest sso74-custom -e MY_ENV=true --loglevel=5 --incremental=true --run
```

Expected output:
<p align="center">
<img src="https://raw.githubusercontent.com/aelkz/sso74-s2i/master/_images/output.png" title="s2i build" width="100%" height="100%" />
</p>

The final standalone-openshift.xml modified:
<p align="center">
<img src="https://raw.githubusercontent.com/aelkz/sso74-s2i/master/_images/output2.png" title="Microservices Security" width="90%" height="90%" />
</p>

### REFERENCES
```
https://www.wildfly.org/news/2020/04/13/How-to-configure-wildfly-s2i-by-cli-operations/
https://www.wildfly.org/news/2019/11/11/WildFly-s2i-openshift-Datasource-configuration/
https://github.com/jboss-openshift/openshift-quickstarts/tree/master/datavirt/derby-driver-image
https://access.redhat.com/documentation/en-us/red_hat_single_sign-on/7.4/html-single/red_hat_single_sign-on_for_openshift_on_openjdk/index
https://github.com/wildfly/wildfly-s2i/tree/master/test/test-app-s2i-cli-scripts
https://jmtd.net/tmp/openjdk-container-docs/openjdk18-openshift.html
https://blog.mshimul.com/how-to-add-oracle-jdbc-driver-in-wildfly/
https://synaptiklabs.com/posts/adding-the-mysql-jdbc-driver-into-wildfly/
https://www.techgalery.com/2019/09/add-mysql-driver-to-wildfly.html
https://github.com/yersan/jaxrs-postgresql-demo/tree/cli-at-s2i
```
