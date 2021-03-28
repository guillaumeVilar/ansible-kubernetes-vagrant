ansible-galaxy install -r requirements.yml 
vagrant up
ansible-playbook -i inventory.yml provision.yml