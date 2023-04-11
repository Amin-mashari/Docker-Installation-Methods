# install ansible

### install by pip
```
python3 -m pip install --user ansible
```


<a href="https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html">Ansible installing guide</a>

## set custom inventory
```
touch ./inventory
```
in inventory you will put host ip or domain to ansible remotely connect to your server 

## list content of custom inventory
```
ansible-inventory -i inventory --list
```

### NOTE:

if you didnt set custom inventory, ansible will read `/etc/ansible/hosts` file as a his default inventory.


## run the playbook with custom inventory

```
ansible-playbook -i inventory docker-setup.yaml
```
