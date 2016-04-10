#!/bin/zsh

while true; do
	RESULT=$(curl "http://status.derintendant.de/ping")
	if ![[ $RESULT = "pong" ]]; then
		echo "PHP-FPM is down";
		echo $RESULT;
	fi
done
