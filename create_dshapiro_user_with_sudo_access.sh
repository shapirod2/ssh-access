#!/usr/bin/env bash

MY_SHELL=$( which bash )

/usr/sbin/useradd -c 'Deborah Shapiro <dshapiro at westcoastinformatics.com>' -s ${MY_SHELL} -m dshapiro
cat >/etc/sudoers.d/dshapiro-ALL <<EOF
dshapiro     ALL=(ALL:ALL) NOPASSWD: ALL
EOF
chmod 0440 /etc/sudoers.d/dshapiro-ALL
mkdir ~dshapiro/.ssh
chmod 700 ~dshapiro/.ssh
curl https://raw.githubusercontent.com/shapirod2/ssh_access/master/shapirod2_rsa.pub >~dshapiro/.ssh/authorized_keys
chmod 400 ~dshapiro/.ssh/authorized_keys
chown -R dshapiro ~dshapiro/.ssh
