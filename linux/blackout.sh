#!/bin/sh

# Download the blocklist
/usr/bin/wget -P /tmp http://www.ipdeny.com/ipblocks/data/aggregated/au-aggregated.zone

# List the current rules in the BLACKOUT filter chain
/sbin/iptables -S BLACKOUT > /tmp/current_rules

# Add new blocks
while read block; do
    # If the block is not found in the current rules, add it
    if ! /bin/grep -qFw "$block" /tmp/current_rules; then
    	/sbin/iptables -A BLACKOUT -s "$block" -j REJECT
    	/sbin/iptables -A BLACKOUT -d "$block" -j REJECT
    fi
done < /tmp/au-aggregated.zone

# Remove old blocks
/bin/grep -Po '\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/\d{1,2}\b' /tmp/current_rules | while read block; do
    if ! /bin/grep -qFw "$block" /tmp/au-aggregated.zone; then
		/sbin/iptables -D BLACKOUT -s "$block" -j REJECT
		/sbin/iptables -D BLACKOUT -d "$block" -j REJECT
	fi
done
