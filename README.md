# checkradius

*A simple Radius checker for Zabbix/Linux*

This is a simple way to test a radius server in the Zabbix or Linux terminal. It has to be used as a "external script" in the Zabbix environment. If the script returns 1 it means you were successfully authenticated, otherwise it returns 0 for a bad authentication. The script can also display the radtest output with a -v parameter.

<img src="https://freeradius.org/img/wordmark.svg?width=32"/>

# Requirements

* radtest (freeradius-utils debian package)
* zabbix-agent (for zabbix usage)


# Usage - Zabbix


# Usage - Linux

```
./checkradius.sh -u john -p 1234 -a 191.52.0.25 -o 1812 -s myradiussecret

```


