# Ansible Commands

### Pre-requisites

***All Ansible Managed Hosts should be enabled for Password Less Login***

```
ssh-copy-id root@172.20.10.2
```

### Generating a sample `ansible.cfg` file

#### The configuration file

Changes can be made and used in a configuration file which will be searched for in the following order:

- ANSIBLE_CONFIG (environment variable if set)

- ansible.cfg (in the current directory)

- ~/.ansible.cfg (in the home directory)

- /etc/ansible/ansible.cfg

Ansible will process the above list and use the first file found, all others are ignored.

```
ansible-config init --disabled -t all > ansible.cfg
```

### Generating a sample `hosts` (inventory) file

```
cat /etc/ansible/hosts
```

```
[local]
localhost

[myservers]
172.20.10.2     ansible_connection=ssh  ansible_user=root
```

### Writing the Ansible Playbook

A simple Ansible Playbook to install Apache `httpd` Server:

```
cat install-apache-server.yml
```

```
---
  - name: install-apache-server-playbook
    hosts: all
    become: yes
    become_user: root
    tasks:
      - name: Ensure Apache Server is at the latest version
        yum:
          name: httpd
          state: latest
      
      - name: Ensure Apache Server is running
        service:
          name: httpd
          state: started
```

### Executing the Ansible Playbook

```
ansible-playbook install-apache-server.yml
```

```
ansible-playbook install-apache-server.yml --syntax-check
```

```
ansible-playbook -i <inventory_file_path> install-apache-server.yml
```

```
ansible-playbook -i <inventory_file_path> install-apache-server.yml --extra-vars "var1='Good Morning'"
```
