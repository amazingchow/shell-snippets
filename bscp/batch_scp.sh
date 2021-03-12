#!/bin/bash

SRC_DIR=./

USERNAME=root
PASSWORD=123456

DST_HOST=a.b.c.d
DST_DIR=/tmp

for FILE in $(ls ${SRC_DIR}); do
    expect -c "
        set timeout 300
        spawn scp -r ${FILE} ${USERNAME}@${DST_HOST}:${DST_DIR}
        expect {
            \"(yes/no)?\" {
                send \"yes\r\"
                expect \"*?assword:*\"
                exp_continue
            }
            \"*?assword:*\" {
                send \"$PASSWORD\r\"
            }
        }
        expect eof
    "
done
