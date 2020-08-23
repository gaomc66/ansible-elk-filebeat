# ansible-elk-filebeat 

This is an ansible playbook to provision elk-stack and filebeat to different servers. This will build a ELK-stack based on docker-compose and setup filebeat based on Ansible galaxy.

The following components will be installed on server:

- Dokcer
- Docker-compose
- Logstash
- Kibana
- ElasticSearch
- Filebeat

## Requirement

In order to run this playbook, the followings are required:

- Python3
- Ansible (built on python)
```shell
> ansible-galaxy install geerlingguy.filebeat
```

## Getting Started

### Running this playbook

There are two ansible tags:
- elk
- filebeat

#### Deploy elk
 - elk, used to only build the elk-stack 
```shell
> ansible-playbook -i hosts -t elk deploy-main.yml -e ansible_python_interpreter=/usr/bin/python3
```

 - filebeat, used to only deploy filebeat 
```shell
> ansible-playbook -i hosts -t filebeat deploy-main.yml -e ansible_python_interpreter=/usr/bin/python3
```

#### HOSTS
the hosts info can be defined in hosts, or /etc/ansible/hosts (without using -i hosts)


### FileBeats
filebeats features is based on ansible galaxy "geerlingguy.filebeat", needs to pre-imported.

```shell
ansible-galaxy install geerlingguy.filebeat
```

the configuration is in /group_vars/all/main.yml : 

``` yml
filebeat_inputs:
  - type: log
    paths:
      - /dev/test.log 
    encoding: utf-8

----------

filebeat_output_logstash_enabled: true
filebeat_output_logstash_hosts:
  - "34.203.244.31:9600"
```

### ELK

ELK related features is in the repo "https://github.com/gaomc66/elk-stack.git"




