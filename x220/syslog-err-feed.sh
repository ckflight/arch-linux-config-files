#!/usr/bin/env bash
tac /var/log/syslog | grep -m 5 -o -i -P '[a-z0-9.\-]+\[[0-9]+\]:.*((error)|(warn)).*$' | sed -e 's/^[a-z0-9.\-]\+\[[0-9]\+\]:/${color white}&${color #888888}/I' | sed -e 's/warn\(ing\)\?/${color yellow}&${color #888888}/Ig' | sed -e 's/err\(or\)\?/${color red}&${color #888888}/Ig'
