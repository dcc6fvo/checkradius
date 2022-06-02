# checkradius

*A simple Radius checker for Linux*

This is a simple way to test a radius server in the Linux terminal. It can be used as a Zabbix external script. If the script returns 1 it means you were successfully authenticated, otherwise it returns 0 for a bad authentication. The script can also display the radtest output with a -v parameter.

<img src="https://freeradius.org/img/wordmark.svg?width=64"/>

# Requirements

* radtest (freeradius-utils debian package)

# Usage

```
./checkradius.sh -u john -p 1234 -a 191.52.0.25 -o 1812 -s myradiussecret

```


