#!/bin/bash

if [[ -n "$HR_USER_ID" ]] ; then
    sed -i -r "s/:1909:/:$HR_USER_ID:/g" /etc/passwd
    sed -i -r "s/:1909:/:$HR_USER_ID:/g" /etc/passwd
    sed -i -r "s/:1909:/:$HR_USER_ID:/g" /etc/group
    chown $HR_USER_ID:$HR_USER_ID /opt/project
    chown -R $HR_USER_ID:$HR_USER_ID /home/hr
fi

cd $WORKING_DIR
