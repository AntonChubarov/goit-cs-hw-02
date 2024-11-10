#!/bin/bash

urls="https://google.com https://facebook.com https://twitter.com"

current_datetime=$(date '+%Y-%m-%d_%H-%M-%S')
log_file="website_status_$current_datetime.log"

> "$log_file"

for url in $urls; do
    status_code=$(curl -o /dev/null -s -w "%{http_code}" -L "$url")

    timestamp=$(date '+%Y-%m-%d %H:%M:%S')

    if [ "$status_code" -eq 200 ]; then
        echo "$timestamp - $url is UP" >> "$log_file"
    else
        echo "$timestamp - $url is DOWN" >> "$log_file"
    fi
done

echo "Websites status checkup is in file $log_file"
