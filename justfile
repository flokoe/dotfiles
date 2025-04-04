host := shell("hostnamectl hostname")

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
bootstrap TAGS="all": ensure_packages clone_repo wait_for_passwords
    @just /tmp/dotfiles/install {{TAGS}}

# Extract all Ansible Vault identitis.
ansible_vault_identities:
    #!/usr/bin/env -S uv run --quiet --script

    # /// script
    # requires-python = ">=3.12"
    # dependencies = ["pyyaml"]
    # ///

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
                            id = line.split(';')[-1].strip()

                            if id.startswith('demv'):
                                vault_ids.append(id + "@passwords")
                            else:
                                vault_ids.append(id + "@vault-bitwarden-client.sh")

    print(','.join(vault_ids))

# Execute ansible commands.
[private]
uvxa +CMD:
    @uvx --from ansible-core --with ansible {{ CMD }}

# Run ansible-galaxy.
ag *OPTS:
    @just uvxa ansible-galaxy {{ OPTS }}

# Run ansible-playbook.
ap *OPTS:
    @just uvxa ansible-playbook {{ OPTS }}

# Execute `main.yml` Ansible playbook.
install TAGS="all" $ANSIBLE_PYTHON_INTERPRETER="auto_silent" $ANSIBLE_VAULT_IDENTITY_LIST=`just ansible_vault_identities`:
    @just ap \
        -i {{ host }}, \
        --ask-become-pass \
        --tags {{TAGS}} \
        --diff \
        main.yml

# Update the dotfiles repository and install.
update TAGS="all":
    @git pull
    @just install {{TAGS}}

# Print all Ansible roles. Mostly used for autocomplection of `dotfiles`.
ansible_roles:
    #!/usr/bin/env -S uv run --quiet --script

    # /// script
    # requires-python = ">=3.12"
    # dependencies = ["pyyaml"]
    # ///

    import yaml, socket

    with open(f"host_vars/{socket.gethostname()}.yaml", 'r') as file:
        default_roles = yaml.safe_load(file).get('default_roles', [])

    print('\n'.join(default_roles))
