#!/bin/bash
# change to your IP address

sudo dnf install -y createrepo rsync httpd
export LOCAL_MIRROR_DIR=/var/www/html/OpenHPC-3
mkdir -p "$LOCAL_MIRROR_DIR"
rsync -av --delete rsync://repos.openhpc.community/OpenHPC/3/ $LOCAL_MIRROR_DIR/
#option if modify content 
#createrepo $LOCAL_MIRROR_DIR/EL_9/x86_64
sudo systemctl enable --now httpd
http://<your-server-ip>/OpenHPC-3/

# Create a .repo file on clients (e.g., /etc/yum.repos.d/openhpc-local.repo):
cat <<EOF | sudo tee "/etc/yum.repos.d/openhpc-local.repo" > /dev/null
[OpenHPC-3-local]
name=OpenHPC 3 Local Mirror
baseurl=http://$SERVER_IP/OpenHPC-3/EL_9/x86_64/
enabled=1
gpgcheck=0
EOF

# Create a cron job (or systemd timer) to sync periodically:
crontab -e
0 3 * * * /usr/bin/rsync -av --delete rsync://repos.openhpc.community/OpenHPC/3/ /var/www/html/OpenHPC-3/
