# List all available recipes.
[private]
default:
    @just --list

# Ensure all required packages for bootstraping are installed.
[private]
ensure_packages:
    #!/usr/bin/env bash
    set -Eeuo pipefail

    if [[ -f /etc/os-release ]]; then
        source /etc/os-release
    else
        echo "Unsupported OS: /etc/os-release not found"
        exit 1
    fi

    case $ID in
        arch)
            sudo pacman -Sy --noconfirm \
                python3 \
                git
            ;;
        bazzite)
            echo "No need to install packages on Bazzite"
            ;;
        # debian|ubuntu)
        #     apt-get update
        #     apt-get install -y \
        #         ansible \
        #         git \
        #         openssh-client \
        #         python3
        #     ;;
        *)
            echo "Unsupported OS: $ID"
            exit 1
            ;;
    esac
    echo ""

[private]
clone_repo:
    @echo "Cloning repository..."
    @git clone https://github.com/flokoe/dotfiles.git /tmp/dotfiles
    @echo ""

[private, confirm("Time to create password files... continue? (y/N)")]
wait_for_passwords:

# Bootstrap my dotfiles.
bootstrap JUST_BIN TAGS="all": ensure_packages clone_repo wait_for_passwords
    @echo "Create venv..."
    @python3 -m venv /tmp/dotfiles/venv
    @echo "Install Ansible..."
    @cd /tmp/dotfiles && source venv/bin/activate && pip install --require-virtualenv -r requirements.txt && deactivate
    @echo ""
    @{{JUST_BIN}} /tmp/dotfiles/install {{TAGS}}

# Extract all Ansible Vault identitis.
ansible_vault_identities:
    #!/usr/bin/env python3
    import os, re, yaml, socket

    with open(f"host_vars/{socket.gethostname()}.yaml", 'r') as file:
        default_roles = yaml.safe_load(file).get('default_roles', [])

    vault_ids = []
    pattern = re.compile(r'^\$ANSIBLE_VAULT')

    for role in default_roles:
        for root, _, files in os.walk(f"roles/{role}"):
            for filename in files:
                filepath = os.path.join(root, filename)

                with open(filepath, 'r') as file:
                    for line in file:
                        if pattern.match(line):
                            vault_ids.append(line.split(';')[-1].strip() + "@vault-bitwarden-client.sh")

    print(','.join(vault_ids))

# Execute `main.yml` Ansible playbook.
install TAGS="all":
    @source venv/bin/activate && \
        ansible-playbook \
            -i inventory.yml \
            --ask-become-pass \
            --tags {{TAGS}} \
            --vault-id p1@password_files/p1 \
            --vault-id demv1@password_files/demv1 \
            main.yml

# Update the dotfiles repository and install.
update TAGS="all":
    @git pull
    @source venv/bin/activate && pip install --require-virtualenv -r requirements.txt
    @just install {{TAGS}}
