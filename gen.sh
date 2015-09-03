#!/bin/bash
line=$@
	name=$(echo "$line" | awk '{print $1}')
	inthostp=$(echo "$line" | awk '{print $2}')
        exthostp=$(echo "$line" | awk '{print $3}')
	luser=$(echo "$line" | awk '{print $4}') 	      
	hbip=$(dig +short AAAA $name.h.static.or.at)

	if [ -z "$hbip" ]; then
		hbip=0:0
	fi 

	echo "if [ \"\$server\" == \"$name\" ]; then
 	int='$inthostp'
 	ext='$exthostp'
	hb='$hbip'
 	suser='$luser'
	fi" >> build/sshvpn

