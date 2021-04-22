#! /bin/bash

set -e

sudo apt install postgresql-11 -y
sudo -u postgres createuser $USER --login --superuser
sudo -u postgres createdb $USER

sudo sed -i -E 's/(local\s+all\s+(postgres|all)\s+)peer/\1md5/' /etc/postgresql/11/main/pg_hba.conf
sudo systemctl restart postgresql.service

