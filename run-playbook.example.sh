#!/bin/bash
echo "Starting at $(date)" >> /path/to/ansible/project/run-playbook.log
eval $(ssh-agent -s) >> /path/to/ansible/project/run-playbook.log 2>&1
ssh-add /path/to/.ssh/ansible >> /path/to/ansible/project/run-playbook.log 2>&1
/usr/bin/ansible-playbook -i /path/to/ansible/project/inventory.ini /path/to/ansible/project/update.yml --vault-password-file /path/to/.vault_pass
kill $SSH_AGENT_PID
echo "Finished at $(date)" >> /path/to/ansible/project/run-playbook.log 2>&1
