#ansible-playbook --check -i inventories/hosts ymls/local.yml --flush-cache -vvv
ansible-playbook -i inventories/hosts ymls/local_${1}.yml --flush-cache -vvv
