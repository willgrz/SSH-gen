#!/bin/bash
rm build/alias
cat start.sh.template > build/sshvpn
cat serverlist | awk '{system("bash gen.sh "$1" "$2" "$3" "$4"")}'
cat end.sh.template >> build/sshvpn
cat serverlist | awk '{print "alias ssh_"$1"=HRPL/usr/sbin/sshvpn",$1"HRPL"}' | sed -e 's/HRPL/"/' -e 's/HRPL/"/' >> build/alias
cat serverlist | awk '{print "alias ssh-"$1"=HRPL/usr/sbin/sshvpn",$1"HRPL"}' | sed -e 's/HRPL/"/' -e 's/HRPL/"/' >> build/alias
chmod +x build/sshvpn
