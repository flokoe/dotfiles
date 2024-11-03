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

# Bootstrap my dotfiles.
bootstrap JUST_BIN TAGS="all": ensure_packages
    @echo "Cloning repository..."
    @git clone git@github.com:flokoe/dotfiles.git ~/Projects/dotfiles
    @echo "Create venv..."
    @python3 -m venv ~/Projects/dotfiles/venv
    @echo "Install Ansible..."
    @cd ~/Projects/dotfiles && source venv/bin/activate && pip install --require-virtualenv -r requirements.txt
    @read -rp 'Time to create password files... continue? (y/N): ' confirm && [[ $confirm == "y" ]] || exit 1
    @echo -e "Run Ansible playbook...\n"
    @{{JUST_BIN}} ~/Projects/dotfiles/install {{TAGS}}

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
