#!/bin/bash
set -e

if [[ ! -f /var/lib/ldap/DB_CONFIG ]]; then
  cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG
fi

chown -R ldap:ldap /var/lib/ldap /etc/openldap/slapd.d

if [[ ! -z "$MAX_NOFILE" ]]; then
  ulimit -n "$MAX_NOFILE"
fi

exec slapd -d 3000 -u ldap -g ldap -h "$SLAPD_URL"