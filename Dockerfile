FROM osixia/openldap:1.4.0


COPY ./schema /etc/ldap/schema
COPY ./ldif /ldif

#ENV LDAP_SEED_INTERNAL_SCHEMA_PATH /schema
ENV LDAP_SEED_INTERNAL_LDIF_PATH /ldif