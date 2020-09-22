### INSTALLATION STEPS

Navigate to the root of the s2i project:
```
cd sso74-custom
```

List all files (double check):
```
 ls -la                                                                                                                                                                                                                                                                   0.02     15:50 22/09/20    192.168.1.197 
  rwxr-xr-x  raphael  staff   352 B    Tue Sep 22 15:50:46 2020    ./
  rwxr-xr-x  raphael  staff   256 B    Tue Sep 22 15:50:45 2020    ../
  rwxr-xr-x  raphael  staff   288 B    Tue Sep 22 15:50:46 2020    .idea/
  rwxr-xr-x  raphael  staff    96 B    Tue Sep 22 14:52:31 2020    .s2i/
  rwxr-xr-x  raphael  staff    96 B    Mon Sep 21 15:12:22 2020    _images/
  rwxr-xr-x  raphael  staff   192 B    Tue Sep 22 15:41:00 2020    openshift/
  rwxr-xr-x  raphael  staff   128 B    Tue Sep 22 15:42:28 2020    s2i-config/
  rw-r--r--  raphael  staff   980 B    Tue Sep 22 15:50:46 2020    README-s2i.md
  rw-r--r--  raphael  staff     2 KiB  Tue Sep 22 15:07:38 2020    README.md
  rw-r--r--  raphael  staff     8 KiB  Tue Sep 22 11:05:26 2020    pom.xml
  rw-r--r--  raphael  staff    80 B    Mon Sep 21 15:08:55 2020    sso74-custom.iml
```

Pull the base image:
```
 docker pull registry.redhat.io/rh-sso-7/sso74-openshift-rhel8:latest                                                                                                                                                                                                                      15:05 22/09/20    192.168.1.197 
```

latest: Pulling from rh-sso-7/sso74-openshift-rhel8
41ae95b593e0: Pull complete
f20f68829d13: Pull complete
bf00a0db0f25: Pull complete
Digest: sha256:ec6801343eb1ca085154d8d7481552f2e9debc414125413d25e42216aa5922af
Status: Downloaded newer image for registry.redhat.io/rh-sso-7/sso74-openshift-rhel8:latest

Then, build the custom image with s2i:
```
s2i build --copy . registry.redhat.io/rh-sso-7/sso74-openshift-rhel8:latest sso74-custom -e MY_ENV=true --loglevel=5 --incremental=true --run
```

expected output
see: _images/output.png


### REFERENCES
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
