#! /bin/bash

set -e

apt install postgresql-13 -y
echo $2
if [[ -v 2 ]]; then
	sudo -u postgres createuser $2
	sudo -u postgres createdb $2
fi

sed -i -E 's/(local\s+all\s+(postgres|all)\s+)peer/\1md5/' /etc/postgresql/13/main/pg_hba.conf
systemctl restart postgresql.service

