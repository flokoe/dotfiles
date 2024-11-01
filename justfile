# Execute `main.yml` Ansible playbook.
install:
  @ansible-playbook \
    -i inventory.yml \
    --ask-become-pass \
    --vault-id p1@password_files/p1 \
    --vault-id demv1@password_files/demv1 \
    main.yml
