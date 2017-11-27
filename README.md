ansible-ispconfig
=====================
This role prepare environment for ISPConfig 3 based on [ISPConfig guide](https://www.howtoforge.com/tutorial/perfect-server-debian-8-jessie-apache-bind-dovecot-ispconfig-3/).

Role **is not tested** on production environment.

Usage:
------
As usual, add this to a playbook:

'''
---

- hosts: A group of hosts
  # I source my variables from a config file instead of setting them in the playbook
  # so that I can have different passwords for different servers
  vars_files:
    - ../private/ispconfig.yml

  roles:
     - ispconfig
'''

Requirements
------------
Debian Stretch

License
-------
BSD
