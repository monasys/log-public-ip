# log-public-ip
Keep a log of your outbound IPv4 and IPv6 addresses.

Add the scripts to your crontab to run on an automated schedule:

`crontab -e`

```
# Log your IP address every 6 hours
0 */6 * * * /path/to/log_ip.sh

# Backup your IP logs once a day (at 00:00)
0 0 * * * /path/to/backup_log_ip.sh
```
