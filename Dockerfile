# FROM osixia/openldap:1.4.0
# EXPOSE 389
FROM centos:centos7

# File Author / Maintainer
LABEL maintainer="mvcrk <mvrck@el.ch>"

# Clean up yum repos to save spaces
RUN yum update -y >/dev/null

# Install epel repos
RUN rpm -Uvh https://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-12.noarch.rpm

# Installing epel
RUN yum -y install epel-release

# Install Openldap Server and Clients package
RUN yum install -y openldap-servers openldap-servers-sql openldap-clients openldap-devel gcc python-devel

# Set Enviroment
env SLAPD_URL ldapi:/// ldap:///

# Adding the run file
ADD run.sh /usr/bin/run.sh

# Set file permission
RUN chmod 755 /usr/bin/run.sh

# Setup Volume (ldap datastore, ldap config)
VOLUME ["/var/lib/ldap", "/etc/openldap/"]

# Set the port to 389 for ldap server
EXPOSE 389

# Executing ldap server
CMD ["/usr/bin/run.sh"]
