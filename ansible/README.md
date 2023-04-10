To execute the playbook only on server1, connecting as sammy, you can use the following command:
```
ansible-playbook playbook.yml -l server1 -u sammy
```
The -l flag specifies your server and the -u flag specifies which user to log into on the remote server.


set inventory
```
ansible-inventory -i inventory --list
```

run the playbook with custom inventory

```
ansible-playbook -i inventory docker-setup.yaml
```
