masterip=$(grep -A 5 "k8s-master" inventory.yml | grep "ansible_host" | awk '{print $2}')
masteruser=$(grep -A 5 "k8s-master" inventory.yml | grep "ansible_ssh_user" | awk '{print $2}')
masterpassword=$(grep -A 5 "k8s-master" inventory.yml | grep "ansible_ssh_password" | awk '{print $2}')

sshpass -p $masterpassword ssh $masteruser@$masterip