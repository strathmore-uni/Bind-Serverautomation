#!/bin/bash

# PART 1: Server side

# 1. Install Packages

apt update
apt apt install bind9 bind9utils -y

# 2. Configure forwarders
#cd /etc/bind
#nano /etc/bind/named.conf.options
# Copy templete file

cp templetes/etc/bind/named.conf.options /etc/bind/named.conf.options

# 3. Add a zone for your domain (e.g. ozy.cns)
#nano /etc/bind/named.conf.default-zones
cp templetes/etc/bind/named.conf.zones /etc/bind/named.conf.zones

# 4. Create a zone file for the domain (Copy the default local zone file and edit it appropriately)
cp /etc/bind/db.local /etc/bind/db.ozy.cns
#nano /etc/bind/db.ozy.cns

cp templetes/etc/bind/db.ozy.cns /etc/bind/db.ozy.cns




# 5. Verify the setup by running the following commands
named-checkconf
named-checkzone ozy.cns /etc/bind/db.ozy.cns

# 6. Reload DNS server configuration
systemctl reload bind9

