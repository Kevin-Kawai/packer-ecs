#!/usr/bin/env bash
set -e

# Configure host to use timezone
# https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/set-time.html
timezone=${TIME_ZONE:-Asia/Tokyo}

echo "### Setting timezone to $timezone ###"
sudo tee /etc/sysconfig/clock << EOF > /dev/null
ZONE="$timezone"
UTC=true
EOF

sudo ln -sf /usr/share/zoneinfo/$timezone /etc/localtime

# Enable NTP
sudo chkconfig ntpd on
