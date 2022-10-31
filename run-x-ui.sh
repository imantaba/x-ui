#!/bin/bash

domain = YOUR_DOMAIN
email = YOUR_MAIL
# please run as root
apt update && apt upgrade -y
apt install curl socat -y
curl https://get.acme.sh | sh
~/.acme.sh/acme.sh --set-default-ca --server letsencrypt
~/.acme.sh/acme.sh --register-account -m $email
~/.acme.sh/acme.sh --issue -d $domain --standalone
~/.acme.sh/acme.sh --installcert -d $domain --key-file /root/private.key --fullchain-file /root/cert.crt
bash <(curl -Ls https://raw.githubusercontent.com/imantaba/x-ui/main/install.sh)

# Fourth question set the port to 54544