#!bin/sh

ansible-galaxy install geerlingguy.filebeat

ansible-playbook -i hosts -t filebeat deploy_main.yml -e ansible_python_interpreter=/usr/bin/python3

ansible-playbook -i hosts -t elk deploy_main.yml -e ansible_python_interpreter=/usr/bin/python3
